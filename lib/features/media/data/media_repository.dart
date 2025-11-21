import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/services/api_service.dart';
import '../models/media_model.dart';

class MediaRepository {
  final ApiService _apiService;

  MediaRepository(this._apiService);

  Future<MediaModel> uploadMedia({
    required String filename,
    required String mimeType,
    required Uint8List bytes,
    String? description,
    String? altText,
    Function(double)? onProgress,
  }) async {
    try {
      final formData = FormData.fromMap({
        'file': MultipartFile.fromBytes(
          bytes,
          filename: filename,
        ),
        'filename': filename,
        'mime_type': mimeType,
        if (description != null) 'description': description,
        if (altText != null) 'alt_text': altText,
      });

      final response = await _apiService.dio.post(
        '/media/upload/',
        data: formData,
        onSendProgress: (sent, total) {
          if (onProgress != null && total > 0) {
            onProgress(sent / total);
          }
        },
      );

      return MediaModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to upload media: $e');
    }
  }

  Future<List<MediaModel>> getMediaList({
    int page = 1,
    int pageSize = 20,
    String? search,
    MediaType? type,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'page': page,
        'page_size': pageSize,
        if (search != null && search.isNotEmpty) 'search': search,
        if (type != null) 'type': type.name,
      };

      final response = await _apiService.get('/media/', queryParameters: queryParams);
      
      final List<dynamic> results = response.data['results'] ?? response.data;
      return results.map((json) => MediaModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch media: $e');
    }
  }

  Future<MediaModel> getMedia(String id) async {
    try {
      final response = await _apiService.get('/media/$id/');
      return MediaModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to fetch media: $e');
    }
  }

  Future<void> deleteMedia(String id) async {
    try {
      await _apiService.delete('/media/$id/');
    } catch (e) {
      throw Exception('Failed to delete media: $e');
    }
  }

  Future<MediaModel> updateMedia({
    required String id,
    String? description,
    String? altText,
  }) async {
    try {
      final data = <String, dynamic>{};
      if (description != null) data['description'] = description;
      if (altText != null) data['alt_text'] = altText;

      final response = await _apiService.patch('/media/$id/', data: data);
      return MediaModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to update media: $e');
    }
  }

  Future<String> getUploadUrl() async {
    try {
      final response = await _apiService.get('/media/upload-url/');
      return response.data['upload_url'];
    } catch (e) {
      throw Exception('Failed to get upload URL: $e');
    }
  }

  Future<void> processMedia(String id) async {
    try {
      await _apiService.post('/media/$id/process/');
    } catch (e) {
      throw Exception('Failed to process media: $e');
    }
  }
}

final mediaRepositoryProvider = Provider<MediaRepository>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  return MediaRepository(apiService);
});