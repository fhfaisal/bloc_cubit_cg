import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Secure storage class for handling authentication tokens.
class SecureStorage {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  /// Saves access and refresh tokens securely.
  Future<void> saveTokens({required String accessToken, required String refreshToken}) async {
    await _storage.write(key: 'access_token', value: accessToken);
    await _storage.write(key: 'refresh_token', value: refreshToken);
  }

  /// Retrieves the access token.
  Future<String?> getAccessToken() async {
    return await _storage.read(key: 'access_token');
  }

  /// Retrieves the refresh token.
  Future<String?> getRefreshToken() async {
    return await _storage.read(key: 'refresh_token');
  }

  /// Deletes stored tokens (for logout).
  Future<void> clearTokens() async {
    await _storage.delete(key: 'access_token');
    await _storage.delete(key: 'refresh_token');
  }
}
