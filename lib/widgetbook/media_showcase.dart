import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:image_picker/image_picker.dart';
import '../features/media/widgets/image_picker_widget.dart';
import '../features/media/models/media_model.dart';
import '../tux/components/tux_button.dart';
import '../tux/theme/tux_spacing.dart';

@UseCase(
  name: 'Image Picker Widget',
  type: ImagePickerWidget,
  description: 'Image picker with upload progress tracking',
)
Widget imagePickerUseCase(BuildContext context) {
  return ProviderScope(
    child: Scaffold(
      appBar: AppBar(title: const Text('Image Picker')),
      body: Padding(
        padding: const EdgeInsets.all(TuxSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Single Image Selection',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: TuxSpacing.md),
            ImagePickerWidget(
              onImageUploaded: (media) {
                print('Image uploaded: ${media.filename}');
              },
              onUploadError: (error) {
                print('Upload error: $error');
              },
            ),
            const SizedBox(height: TuxSpacing.xl),
            const Text(
              'Multiple Image Selection',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: TuxSpacing.md),
            ImagePickerWidget(
              allowMultiple: true,
              buttonText: 'Select Multiple Images',
              buttonIcon: Icons.photo_library,
              buttonVariant: TuxButtonVariant.secondary,
              onImageUploaded: (media) {
                print('Image uploaded: ${media.filename}');
              },
              onUploadError: (error) {
                print('Upload error: $error');
              },
            ),
          ],
        ),
      ),
    ),
  );
}

@UseCase(
  name: 'Multi Image Picker',
  type: Widget,
  description: 'Multi-image picker with grid preview',
)
Widget multiImagePickerUseCase(BuildContext context) {
  return ProviderScope(
    child: Scaffold(
      appBar: AppBar(title: const Text('Multi Image Picker')),
      body: Padding(
        padding: const EdgeInsets.all(TuxSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Multi-Image Selection with Grid Preview',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: TuxSpacing.md),
            Expanded(
              child: MultiImagePicker(
                maxImages: 6,
                onImagesUploaded: (images) {
                  print('Selected ${images.length} images');
                  for (final image in images) {
                    print('- ${image.filename}');
                  }
                },
                onUploadError: (error) {
                  print('Upload error: $error');
                },
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

@UseCase(
  name: 'Camera Only Picker',
  type: ImagePickerWidget,
  description: 'Image picker restricted to camera only',
)
Widget cameraOnlyPickerUseCase(BuildContext context) {
  return ProviderScope(
    child: Scaffold(
      appBar: AppBar(title: const Text('Camera Only')),
      body: Padding(
        padding: const EdgeInsets.all(TuxSpacing.lg),
        child: Column(
          children: [
            const Text(
              'Camera Only Image Picker',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: TuxSpacing.md),
            ImagePickerWidget(
              preferredSource: ImageSource.camera,
              buttonText: 'Take Photo',
              buttonIcon: Icons.camera_alt,
              buttonVariant: TuxButtonVariant.primary,
              onImageUploaded: (media) {
                print('Photo taken: ${media.filename}');
              },
              onUploadError: (error) {
                print('Camera error: $error');
              },
            ),
          ],
        ),
      ),
    ),
  );
}