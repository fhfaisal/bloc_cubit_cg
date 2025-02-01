import 'dart:async';
import 'package:dio/dio.dart';

import '../storage/secure_storage.dart';

/// Dio interceptor to handle authentication, token refreshing, and errors securely.
class ApiInterceptor extends Interceptor {
  final Dio dio;
  final SecureStorage secureStorage;

  ApiInterceptor({required this.dio, required this.secureStorage});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    String? token = await secureStorage.getAccessToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    options.headers['Content-Type'] = 'application/json';

    super.onRequest(options, handler);
  }


  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      bool refreshed = await _refreshToken();
      if (refreshed) {
        final RequestOptions requestOptions = err.requestOptions;
        final Response retryResponse = await dio.fetch(requestOptions);
        return handler.resolve(retryResponse);
      }
    }
    handler.reject(err);
  }

  /// Attempts to refresh the token securely.
  Future<bool> _refreshToken() async {
    try {
      String? refreshToken = await secureStorage.getRefreshToken();
      if (refreshToken == null) return false;

      final response = await dio.post(
        'https://yourapi.com/auth/refresh',
        data: {'refresh_token': refreshToken},
      );

      if (response.statusCode == 200) {
        await secureStorage.saveTokens(
          accessToken: response.data['access_token'],
          refreshToken: response.data['refresh_token'],
        );
        return true;
      } else {
        await secureStorage.clearTokens();
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
