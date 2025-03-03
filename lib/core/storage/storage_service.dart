// lib/core/storage/storage_service.dart
import 'package:cubit_bloc/core/storage/storage_constants.dart';
import 'package:get_storage/get_storage.dart';

import '../../data/models/user_model.dart';
import '../../domain/entities/user.dart';

class StorageService {
  final GetStorage _appStorage = GetStorage();

  Future<void> init() async {
    await GetStorage.init();
  }

  // Secure storage for tokens
  Future<void> saveAuthToken(String token) async {
    await _appStorage.write(AppStore.authToken,token);
  }

  Future<String?> getAuthToken() async {
    return _appStorage.read(AppStore.authToken);
  }

  Future<void> clearAuthToken() async {
    await _appStorage.remove(AppStore.authToken);
  }

  // General storage for user data
  Future<void> saveUserData(UserModel user) async {
    await _appStorage.write(AppStore.userData, {
      'id': user.user!.id,
      'email': user.user!.email,
      'account_type': user.user!.accountType,
      'name': user.user!.name,
      'first_name': user.user!.firstName,
      'last_name': user.user!.lastName,
    });
  }

  Future<User?> getUserData() async {
    final userData = _appStorage.read(AppStore.userData);
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
  }
}