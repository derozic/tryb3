import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import '../../../tux/components/tux_button.dart';
import '../../../tux/components/tux_card.dart';
import '../models/media_model.dart';
import '../providers/media_provider.dart';

class ImagePickerWidget extends ConsumerStatefulWidget {
  final Function(MediaModel)? onImageUploaded;
  final Function(String)? onUploadError;
  final bool allowMultiple;
  final ImageSource? preferredSource;
  final String? buttonText;
  final IconData? buttonIcon;
  final TuxButtonVariant buttonVariant;

  const ImagePickerWidget({
    Key? key,
    this.onImageUploaded,
    this.onUploadError,
    this.allowMultiple = false,
    this.preferredSource,
    this.buttonText,
    this.buttonIcon,
    this.buttonVariant = TuxButtonVariant.primary,
  }) : super(key: key);

  @override
  ConsumerState<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends ConsumerState<ImagePickerWidget> {
  final ImagePicker _picker = ImagePicker();
  bool _isUploading = false;

  Future<void> _pickImage() async {
    try {
      List<XFile> images = [];

      if (widget.preferredSource != null) {
        if (widget.allowMultiple) {
          images = await _picker.pickMultiImage() ?? [];
        } else {
          final image = await _picker.pickImage(source: widget.preferredSource!);
          if (image != null) images = [image];
        }
      } else {
        // Show source selection dialog
        final source = await _showSourceSelectionDialog();
        if (source == null) return;

        if (widget.allowMultiple && source == ImageSource.gallery) {
          images = await _picker.pickMultiImage() ?? [];
        } else {
          final image = await _picker.pickImage(source: source);
          if (image != null) images = [image];
        }
      }

      if (images.isEmpty) return;

      setState(() => _isUploading = true);

      for (final image in images) {
        await _uploadImage(image);
      }
    } catch (e) {
      widget.onUploadError?.call('Failed to pick image: $e');
    } finally {
      setState(() => _isUploading = false);
    }
  }

  Future<void> _uploadImage(XFile image) async {
    try {
      final bytes = await image.readAsBytes();
      final filename = image.name;
      final mimeType = _getMimeType(image.path);

      // Add to upload tracker
      ref.read(mediaUploadProvider.notifier).addUpload(filename);

      final media = await ref.read(mediaProvider.notifier).uploadMedia(
        filename: filename,
        mimeType: mimeType,
        bytes: bytes,
      );

      if (media != null) {
        ref.read(mediaUploadProvider.notifier).setCompleted(filename);
        widget.onImageUploaded?.call(media);
      }
    } catch (e) {
      final filename = image.name;
      ref.read(mediaUploadProvider.notifier).setError(filename, e.toString());
      widget.onUploadError?.call('Failed to upload ${image.name}: $e');
    }
  }

  String _getMimeType(String path) {
    final extension = path.toLowerCase().split('.').last;
    switch (extension) {
      case 'jpg':
      case 'jpeg':
        return 'image/jpeg';
      case 'png':
        return 'image/png';
      case 'gif':
        return 'image/gif';
      case 'webp':
        return 'image/webp';
      default:
        return 'image/jpeg';
    }
  }

  Future<ImageSource?> _showSourceSelectionDialog() async {
    return showDialog<ImageSource>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Select Image Source'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Camera'),
              onTap: () => Navigator.pop(context, ImageSource.camera),
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Gallery'),
              onTap: () => Navigator.pop(context, ImageSource.gallery),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final uploadProgress = ref.watch(mediaUploadProvider);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TuxButton(
          text: widget.buttonText ?? 'Select Images',
          icon: widget.buttonIcon ?? Icons.image,
          variant: widget.buttonVariant,
          loading: _isUploading,
          onPressed: _isUploading ? null : _pickImage,
        ),
        if (uploadProgress.isNotEmpty) ...[
          const SizedBox(height: 16),
          ...uploadProgress.entries.map((entry) => 
            _UploadProgressTile(
              progress: entry.value,
              onRemove: () => ref.read(mediaUploadProvider.notifier).removeUpload(entry.key),
            ),
          ),
        ],
      ],
    );
  }
}

class _UploadProgressTile extends StatelessWidget {
  final MediaUploadProgress progress;
  final VoidCallback onRemove;

  const _UploadProgressTile({
    required this.progress,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TuxCard(
      variant: TuxCardVariant.outlined,
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            _buildStatusIcon(theme),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    progress.filename,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  if (progress.status == MediaUploadStatus.uploading) ...[
                    LinearProgressIndicator(value: progress.progress),
                    const SizedBox(height: 4),
                    Text(
                      '${(progress.progress * 100).toStringAsFixed(1)}%',
                      style: theme.textTheme.bodySmall,
                    ),
                  ] else ...[
                    Text(
                      _getStatusText(),
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: _getStatusColor(theme),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            if (progress.isComplete || progress.hasError)
              IconButton(
                icon: const Icon(Icons.close, size: 20),
                onPressed: onRemove,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusIcon(ThemeData theme) {
    switch (progress.status) {
      case MediaUploadStatus.pending:
        return Icon(Icons.schedule, color: theme.colorScheme.outline);
      case MediaUploadStatus.uploading:
        return SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            value: progress.progress,
          ),
        );
      case MediaUploadStatus.processing:
        return SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(strokeWidth: 2),
        );
      case MediaUploadStatus.completed:
        return Icon(Icons.check_circle, color: theme.colorScheme.primary);
      case MediaUploadStatus.error:
        return Icon(Icons.error, color: theme.colorScheme.error);
      case MediaUploadStatus.cancelled:
        return Icon(Icons.cancel, color: theme.colorScheme.outline);
    }
  }

  String _getStatusText() {
    switch (progress.status) {
      case MediaUploadStatus.pending:
        return 'Pending...';
      case MediaUploadStatus.uploading:
        return 'Uploading...';
      case MediaUploadStatus.processing:
        return 'Processing...';
      case MediaUploadStatus.completed:
        return 'Upload complete';
      case MediaUploadStatus.error:
        return progress.error ?? 'Upload failed';
      case MediaUploadStatus.cancelled:
        return 'Cancelled';
    }
  }

  Color _getStatusColor(ThemeData theme) {
    switch (progress.status) {
      case MediaUploadStatus.pending:
      case MediaUploadStatus.uploading:
      case MediaUploadStatus.processing:
        return theme.colorScheme.outline;
      case MediaUploadStatus.completed:
        return theme.colorScheme.primary;
      case MediaUploadStatus.error:
        return theme.colorScheme.error;
      case MediaUploadStatus.cancelled:
        return theme.colorScheme.outline;
    }
  }
}

class MultiImagePicker extends ConsumerWidget {
  final Function(List<MediaModel>)? onImagesUploaded;
  final Function(String)? onUploadError;
  final int? maxImages;

  const MultiImagePicker({
    Key? key,
    this.onImagesUploaded,
    this.onUploadError,
    this.maxImages,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedImages = ref.watch(selectedImagesProvider);

    return Column(
      children: [
        ImagePickerWidget(
          allowMultiple: true,
          onImageUploaded: (media) {
            ref.read(selectedImagesProvider.notifier).addImage(media);
          },
          onUploadError: onUploadError,
        ),
        if (selectedImages.isNotEmpty) ...[
          const SizedBox(height: 16),
          _SelectedImagesGrid(
            images: selectedImages,
            onRemove: (media) {
              ref.read(selectedImagesProvider.notifier).removeImage(media.id);
            },
            onReorder: (oldIndex, newIndex) {
              ref.read(selectedImagesProvider.notifier).reorderImages(oldIndex, newIndex);
            },
          ),
          const SizedBox(height: 16),
          TuxButton(
            text: 'Use Selected Images (${selectedImages.length})',
            onPressed: () {
              onImagesUploaded?.call(selectedImages);
              ref.read(selectedImagesProvider.notifier).clear();
            },
          ),
        ],
      ],
    );
  }
}

class _SelectedImagesGrid extends StatelessWidget {
  final List<MediaModel> images;
  final Function(MediaModel) onRemove;
  final Function(int, int) onReorder;

  const _SelectedImagesGrid({
    required this.images,
    required this.onRemove,
    required this.onReorder,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: images.length,
      itemBuilder: (context, index) {
        final image = images[index];
        return Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                image.thumbnailUrl ?? image.url,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 4,
              right: 4,
              child: GestureDetector(
                onTap: () => onRemove(image),
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.black54,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class SelectedImagesNotifier extends StateNotifier<List<MediaModel>> {
  SelectedImagesNotifier() : super([]);

  void addImage(MediaModel image) {
    state = [...state, image];
  }

  void removeImage(String imageId) {
    state = state.where((img) => img.id != imageId).toList();
  }

  void reorderImages(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) newIndex -= 1;
    final items = List<MediaModel>.from(state);
    final item = items.removeAt(oldIndex);
    items.insert(newIndex, item);
    state = items;
  }

  void clear() {
    state = [];
  }
}

final selectedImagesProvider = StateNotifierProvider<SelectedImagesNotifier, List<MediaModel>>(
  (ref) => SelectedImagesNotifier(),
);