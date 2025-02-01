// lib/core/storage/storage_service.dart
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_storage/get_storage.dart';

import '../../data/models/user_model.dart';
import '../../domain/entities/user.dart';

class StorageService {
  final GetStorage _appStorage = GetStorage();
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  Future<void> init() async {
    await GetStorage.init();
  }

  // Secure storage for tokens
  Future<void> saveAuthToken(String token) async {
    await _secureStorage.write(key: 'auth_token', value: token);
  }

  Future<String?> getAuthToken() async {
    return await _secureStorage.read(key: 'auth_token');
  }

  Future<void> clearAuthToken() async {
    await _secureStorage.delete(key: 'auth_token');
  }

  // General storage for user data
  Future<void> saveUserData(UserModel user) async {
    await _appStorage.write('user_data', {
      'id': user.user!.id,
      'email': user.user!.email,
      'account_type': user.user!.accountType,
      'name': user.user!.name,
      'first_name': user.user!.firstName,
      'last_name': user.user!.lastName,
    });
  }

  Future<User?> getUserData() async {
    final userData = _appStorage.read('user_data');
    final token = await getAuthToken();

    if (userData == null || token == null) return null;

    return User(
      id: userData['id'],
      email: userData['email'],
      accountType: userData['account_type'],
      name: userData['name'],
      firstName: userData['first_name'],
      lastName: userData['last_name'],
      token: token,
    );
  }

  Future<void> clearAllData() async {
    await _appStorage.erase();
    await _secureStorage.deleteAll();
  }
}