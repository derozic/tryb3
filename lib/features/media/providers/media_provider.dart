import 'dart:typed_data';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/media_repository.dart';
import '../models/media_model.dart';

class MediaNotifier extends StateNotifier<AsyncValue<List<MediaModel>>> {
  final MediaRepository _repository;

  MediaNotifier(this._repository) : super(const AsyncValue.loading()) {
    loadMedia();
  }

  Future<void> loadMedia({
    int page = 1,
    int pageSize = 20,
    String? search,
    MediaType? type,
  }) async {
    try {
      state = const AsyncValue.loading();
      final media = await _repository.getMediaList(
        page: page,
        pageSize: pageSize,
        search: search,
        type: type,
      );
      state = AsyncValue.data(media);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }

  Future<MediaModel?> uploadMedia({
    required String filename,
    required String mimeType,
    required Uint8List bytes,
    String? description,
    String? altText,
  }) async {
    try {
      final media = await _repository.uploadMedia(
        filename: filename,
        mimeType: mimeType,
        bytes: bytes,
        description: description,
        altText: altText,
      );

      // Add to current list if we have data
      state.whenData((currentMedia) {
        state = AsyncValue.data([media, ...currentMedia]);
      });

      return media;
    } catch (e) {
      // Don't update state on error, just rethrow
      rethrow;
    }
  }

  Future<void> deleteMedia(String id) async {
    try {
      await _repository.deleteMedia(id);
      
      // Remove from current list
      state.whenData((currentMedia) {
        final updatedMedia = currentMedia.where((m) => m.id != id).toList();
        state = AsyncValue.data(updatedMedia);
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<MediaModel?> updateMedia({
    required String id,
    String? description,
    String? altText,
  }) async {
    try {
      final updatedMedia = await _repository.updateMedia(
        id: id,
        description: description,
        altText: altText,
      );

      // Update in current list
      state.whenData((currentMedia) {
        final updatedList = currentMedia.map((m) {
          return m.id == id ? updatedMedia : m;
        }).toList();
        state = AsyncValue.data(updatedList);
      });

      return updatedMedia;
    } catch (e) {
      rethrow;
    }
  }

  void refresh() {
    loadMedia();
  }
}

class MediaUploadNotifier extends StateNotifier<Map<String, MediaUploadProgress>> {
  MediaUploadNotifier() : super({});

  void addUpload(String filename) {
    state = {
      ...state,
      filename: MediaUploadProgress(
        filename: filename,
        bytesUploaded: 0,
        totalBytes: 0,
        status: MediaUploadStatus.pending,
      ),
    };
  }

  void updateProgress(String filename, int bytesUploaded, int totalBytes) {
    final current = state[filename];
    if (current != null) {
      state = {
        ...state,
        filename: current.copyWith(
          bytesUploaded: bytesUploaded,
          totalBytes: totalBytes,
          status: MediaUploadStatus.uploading,
        ),
      };
    }
  }

  void setProcessing(String filename) {
    final current = state[filename];
    if (current != null) {
      state = {
        ...state,
        filename: current.copyWith(
          status: MediaUploadStatus.processing,
        ),
      };
    }
  }

  void setCompleted(String filename) {
    final current = state[filename];
    if (current != null) {
      state = {
        ...state,
        filename: current.copyWith(
          status: MediaUploadStatus.completed,
        ),
      };
    }
  }

  void setError(String filename, String error) {
    final current = state[filename];
    if (current != null) {
      state = {
        ...state,
        filename: current.copyWith(
          status: MediaUploadStatus.error,
          error: error,
        ),
      };
    }
  }

  void removeUpload(String filename) {
    state = Map.fromEntries(
      state.entries.where((entry) => entry.key != filename),
    );
  }

  void clearCompleted() {
    state = Map.fromEntries(
      state.entries.where((entry) => 
        entry.value.status != MediaUploadStatus.completed),
    );
  }
}

final mediaProvider = StateNotifierProvider<MediaNotifier, AsyncValue<List<MediaModel>>>(
  (ref) {
    final repository = ref.watch(mediaRepositoryProvider);
    return MediaNotifier(repository);
  },
);

final mediaUploadProvider = StateNotifierProvider<MediaUploadNotifier, Map<String, MediaUploadProgress>>(
  (ref) => MediaUploadNotifier(),
);

final selectedMediaProvider = StateProvider<MediaModel?>((ref) => null);