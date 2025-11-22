import 'package:freezed_annotation/freezed_annotation.dart';

part 'media_model.freezed.dart';
part 'media_model.g.dart';

@freezed
class MediaModel with _$MediaModel {
  const factory MediaModel({
    required String id,
    required String filename,
    required String originalFilename,
    required String mimeType,
    required int fileSize,
    required String url,
    String? thumbnailUrl,
    int? width,
    int? height,
    String? description,
    String? altText,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _MediaModel;

  factory MediaModel.fromJson(Map<String, dynamic> json) =>
      _$MediaModelFromJson(json);
}

enum MediaType {
  image,
  video,
  document,
  audio,
}

@freezed
class MediaUploadRequest with _$MediaUploadRequest {
  const factory MediaUploadRequest({
    required String filename,
    required String mimeType,
    required List<int> bytes,
    String? description,
    String? altText,
  }) = _MediaUploadRequest;

  factory MediaUploadRequest.fromJson(Map<String, dynamic> json) =>
      _$MediaUploadRequestFromJson(json);
}

@freezed
class MediaUploadProgress with _$MediaUploadProgress {
  const factory MediaUploadProgress({
    required String filename,
    required int bytesUploaded,
    required int totalBytes,
    required MediaUploadStatus status,
    String? error,
  }) = _MediaUploadProgress;

  const MediaUploadProgress._();

  double get progress => totalBytes > 0 ? bytesUploaded / totalBytes : 0.0;
  bool get isComplete => status == MediaUploadStatus.completed;
  bool get hasError => status == MediaUploadStatus.error;
}

enum MediaUploadStatus {
  pending,
  uploading,
  processing,
  completed,
  error,
  cancelled,
}