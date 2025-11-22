import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  late final Dio _dio;
  final String baseUrl;

  ApiService({required this.baseUrl}) {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ));

    _setupInterceptors();
  }

  void _setupInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // Add auth token if available
          final prefs = await SharedPreferences.getInstance();
          final token = prefs.getString('auth_token');
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          handler.next(options);
        },
        onError: (error, handler) {
          // Handle common errors
          if (error.response?.statusCode == 401) {
            // Handle unauthorized - clear token
            _clearAuthToken();
          }
          handler.next(error);
        },
      ),
    );

    // Add logging in debug mode
    if (true) { // You might want to add a debug flag here
      _dio.interceptors.add(
        LogInterceptor(
          requestBody: true,
          responseBody: true,
          error: true,
        ),
      );
    }
  }

  Future<void> _clearAuthToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
  }

  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.get<T>(
        path,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.post<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  Future<Response<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.put<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  Future<Response<T>> patch<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.patch<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  Future<Response<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.delete<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  Future<Response> upload(
    String path,
    String filePath, {
    String? fileName,
    Map<String, dynamic>? additionalData,
  }) async {
    try {
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(filePath, filename: fileName),
        if (additionalData != null) ...additionalData,
      });

      return await _dio.post(
        path,
        data: formData,
        options: Options(
          contentType: 'multipart/form-data',
        ),
      );
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }
}

class ApiException implements Exception {
  final String message;
  final int? statusCode;
  final dynamic data;

  ApiException({
    required this.message,
    this.statusCode,
    this.data,
  });

  factory ApiException.fromDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return ApiException(
          message: 'Connection timeout. Please check your internet connection.',
          statusCode: null,
        );
      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        final message = _getErrorMessage(statusCode, error.response?.data);
        return ApiException(
          message: message,
          statusCode: statusCode,
          data: error.response?.data,
        );
      case DioExceptionType.cancel:
        return ApiException(
          message: 'Request cancelled',
          statusCode: null,
        );
      case DioExceptionType.unknown:
        return ApiException(
          message: 'Network error. Please check your internet connection.',
          statusCode: null,
        );
      default:
        return ApiException(
          message: error.message ?? 'An unexpected error occurred',
          statusCode: null,
        );
    }
  }

  static String _getErrorMessage(int? statusCode, dynamic responseData) {
    if (responseData is Map<String, dynamic>) {
      // Try to extract error message from response
      final message = responseData['message'] ?? 
                     responseData['error'] ?? 
                     responseData['detail'];
      if (message != null) {
        return message.toString();
      }
    }

    // Fallback to status code messages
    switch (statusCode) {
      case 400:
        return 'Bad request. Please check your input.';
      case 401:
        return 'Unauthorized. Please log in again.';
      case 403:
        return 'Access denied.';
      case 404:
        return 'Resource not found.';
      case 500:
        return 'Server error. Please try again later.';
      default:
        return 'An error occurred. Please try again.';
    }
  }

  @override
  String toString() {
    return 'ApiException: $message${statusCode != null ? ' (Status: $statusCode)' : ''}';
  }
}

final apiServiceProvider = Provider<ApiService>((ref) {
  // You might want to make this configurable via environment variables
  const baseUrl = 'http://localhost:8000/api';
  return ApiService(baseUrl: baseUrl);
});