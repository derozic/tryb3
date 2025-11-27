import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:logger/logger.dart';

class UnifiedAuthService {
  final Dio _dio;
  final Logger _logger = Logger();
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email', 'profile'],
  );
  
  static const String _tokenKey = 'auth_token';
  static const String _userKey = 'user_data';
  static const String _refreshTokenKey = 'refresh_token';
  
  String? _authToken;
  Map<String, dynamic>? _userData;
  
  UnifiedAuthService({Dio? dio}) : _dio = dio ?? Dio() {
    _initializeService();
  }
  
  Future<void> _initializeService() async {
    final prefs = await SharedPreferences.getInstance();
    _authToken = prefs.getString(_tokenKey);
    final userJson = prefs.getString(_userKey);
    if (userJson != null) {
      _userData = jsonDecode(userJson);
    }
    
    // Configure Dio interceptor for auth headers
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          if (_authToken != null) {
            options.headers['Authorization'] = 'Bearer $_authToken';
          }
          handler.next(options);
        },
        onError: (error, handler) async {
          if (error.response?.statusCode == 401) {
            // Token expired, attempt refresh
            final refreshed = await _refreshToken();
            if (refreshed) {
              // Retry the request
              final opts = Options(
                method: error.requestOptions.method,
                headers: error.requestOptions.headers,
              );
              opts.headers?['Authorization'] = 'Bearer $_authToken';
              
              final response = await _dio.request(
                error.requestOptions.path,
                options: opts,
                data: error.requestOptions.data,
                queryParameters: error.requestOptions.queryParameters,
              );
              return handler.resolve(response);
            }
          }
          handler.next(error);
        },
      ),
    );
  }
  
  String get baseUrl {
    return const String.fromEnvironment(
      'API_URL',
      defaultValue: 'http://localhost:8245',
    );
  }
  
  // Google Sign-In
  Future<Map<String, dynamic>> signInWithGoogle({String? hostedDomain}) async {
    try {
      // Note: hostedDomain configuration may need plugin update
      // For now, proceed with standard Google Sign-In
      
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return {
          'success': false,
          'error': 'Google sign-in was cancelled',
        };
      }
      
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      
      // Send Google token to backend for verification
      final response = await _dio.post(
        '$baseUrl/api/auth/google',
        data: {
          'id_token': googleAuth.idToken,
          'access_token': googleAuth.accessToken,
          'google_id': googleUser.id,
          'email': googleUser.email,
          'display_name': googleUser.displayName,
          'photo_url': googleUser.photoUrl,
        },
      );
      
      if (response.statusCode == 200) {
        final data = response.data;
        await _saveAuthData(data['token'], data['user']);
        
        return {
          'success': true,
          'user': data['user'],
          'token': data['token'],
        };
      }
      
      return {
        'success': false,
        'error': 'Failed to authenticate with backend',
      };
    } catch (e) {
      _logger.e('Google sign-in error: $e');
      return {
        'success': false,
        'error': e.toString(),
      };
    }
  }
  
  // Phone OTP Authentication
  Future<Map<String, dynamic>> sendOTP(String phoneNumber) async {
    try {
      final response = await _dio.post(
        '$baseUrl/api/auth/otp/send',
        data: {
          'phone_number': phoneNumber,
        },
      );
      
      if (response.statusCode == 200) {
        return {
          'success': true,
          'message': 'OTP sent successfully',
        };
      }
      
      return {
        'success': false,
        'error': 'Failed to send OTP',
      };
    } catch (e) {
      _logger.e('Send OTP error: $e');
      return {
        'success': false,
        'error': e.toString(),
      };
    }
  }
  
  Future<Map<String, dynamic>> verifyOTP(String phoneNumber, String otpCode) async {
    try {
      final response = await _dio.post(
        '$baseUrl/api/auth/otp/verify',
        data: {
          'phone_number': phoneNumber,
          'otp_code': otpCode,
        },
      );
      
      if (response.statusCode == 200) {
        final data = response.data;
        await _saveAuthData(data['token'], data['user']);
        
        return {
          'success': true,
          'user': data['user'],
          'token': data['token'],
        };
      }
      
      return {
        'success': false,
        'error': 'Invalid OTP code',
      };
    } catch (e) {
      _logger.e('Verify OTP error: $e');
      return {
        'success': false,
        'error': e.toString(),
      };
    }
  }
  
  // Link Google account to existing phone-based account
  Future<Map<String, dynamic>> linkGoogleAccount(
    String phoneNumber,
    String otpCode,
    String googleToken,
  ) async {
    try {
      final response = await _dio.post(
        '$baseUrl/api/auth/link-accounts',
        data: {
          'phone_number': phoneNumber,
          'otp_code': otpCode,
          'google_token': googleToken,
        },
      );
      
      if (response.statusCode == 200) {
        final data = response.data;
        await _saveAuthData(data['token'], data['user']);
        
        return {
          'success': true,
          'user': data['user'],
          'message': 'Accounts linked successfully',
        };
      }
      
      return {
        'success': false,
        'error': 'Failed to link accounts',
      };
    } catch (e) {
      _logger.e('Link accounts error: $e');
      return {
        'success': false,
        'error': e.toString(),
      };
    }
  }
  
  // Check authentication status
  Future<bool> isAuthenticated() async {
    if (_authToken == null) return false;
    
    try {
      final response = await _dio.get('$baseUrl/api/auth/status');
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
  
  // Get current user data
  Map<String, dynamic>? get currentUser => _userData;
  String? get authToken => _authToken;
  
  // Refresh token
  Future<bool> _refreshToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final refreshToken = prefs.getString(_refreshTokenKey);
      
      if (refreshToken == null) return false;
      
      final response = await _dio.post(
        '$baseUrl/api/auth/refresh',
        data: {
          'refresh_token': refreshToken,
        },
      );
      
      if (response.statusCode == 200) {
        final data = response.data;
        await _saveAuthData(data['token'], _userData);
        return true;
      }
      
      return false;
    } catch (e) {
      _logger.e('Token refresh error: $e');
      return false;
    }
  }
  
  // Save authentication data
  Future<void> _saveAuthData(String token, Map<String, dynamic>? user) async {
    final prefs = await SharedPreferences.getInstance();
    
    _authToken = token;
    _userData = user;
    
    await prefs.setString(_tokenKey, token);
    if (user != null) {
      await prefs.setString(_userKey, jsonEncode(user));
    }
  }
  
  // Logout
  Future<void> logout() async {
    try {
      // Notify backend of logout
      await _dio.post('$baseUrl/api/auth/logout');
    } catch (e) {
      _logger.e('Logout API error: $e');
    }
    
    // Clear local data
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
    await prefs.remove(_userKey);
    await prefs.remove(_refreshTokenKey);
    
    _authToken = null;
    _userData = null;
    
    // Sign out from Google if signed in
    await _googleSignIn.signOut();
  }
  
  // Update user profile
  Future<Map<String, dynamic>> updateProfile(Map<String, dynamic> updates) async {
    try {
      final response = await _dio.put(
        '$baseUrl/api/users/profile',
        data: updates,
      );
      
      if (response.statusCode == 200) {
        final data = response.data;
        _userData = data['user'];
        
        // Save updated user data
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString(_userKey, jsonEncode(_userData));
        
        return {
          'success': true,
          'user': _userData,
        };
      }
      
      return {
        'success': false,
        'error': 'Failed to update profile',
      };
    } catch (e) {
      _logger.e('Update profile error: $e');
      return {
        'success': false,
        'error': e.toString(),
      };
    }
  }
}