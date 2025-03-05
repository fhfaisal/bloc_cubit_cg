// lib/core/storage/storage_service.dart
import 'package:cubit_bloc/core/storage/storage_constants.dart';
import 'package:get_storage/get_storage.dart';

import '../../data/models/user_model.dart';
import '../../domain/entities/user.dart';

class StorageService {
  // Instance of GetStorage for handling local storage
  final GetStorage _appStorage = GetStorage();

  // Initialize GetStorage before using it
  Future<void> init() async {
    await GetStorage.init();
  }

  // Securely store the authentication token
  Future<void> saveAuthToken(String token) async {
    await _appStorage.write(AppStore.authToken, token);
  }

  // Retrieve the stored authentication token
  Future<String?> getAuthToken() async {
    return _appStorage.read(AppStore.authToken);
  }

  // Remove the stored authentication token
  Future<void> clearAuthToken() async {
    await _appStorage.remove(AppStore.authToken);
  }

  // Store user data in local storage
  Future<void> saveUserData(User user) async {
    await _appStorage.write(AppStore.userData, {
      'id': user.id, // Ensure user object is not null before accessing fields
      'email': user.email,
      'account_type': user.accountType,
      'name': user.name,
      'first_name': user.firstName,
      'last_name': user.lastName,
    });
  }

  // Retrieve stored user data and reconstruct the User object
  Future<User?> getUserData() async {
    final userData = _appStorage.read(AppStore.userData);
    final token = await getAuthToken();

    // Return null if no user data or token is found
    if (userData == null || token == null) return null;

    return User(
      id: userData['id'],
      email: userData['email'],
      accountType: userData['account_type'],
      name: userData['name'],
      firstName: userData['first_name'],
      lastName: userData['last_name'],
      token: token, // Attach the token for user authentication
    );
  }

  // Set the first-time launch flag
  setFirstTime(bool isFirstTime) {
     _appStorage.write(AppStore.isFirstTime, isFirstTime);
  }

  // Check if it's the first time the app is launched
  bool isFirstTime() {
    return _appStorage.read(AppStore.isFirstTime) ?? true;
  }

  // Set the login status
  Future<void> setLoggedIn(bool isLoggedIn) async {
    await _appStorage.write(AppStore.isLoggedIn, isLoggedIn);
  }

  // Check if the user is logged in
  bool isLoggedIn() {
    return _appStorage.read(AppStore.isLoggedIn) ?? false;
  }

  // Clear all stored data, including user data and authentication token
  Future<void> clearAllData() async {
    await _appStorage.erase();
  }
}
