import 'package:get_storage/get_storage.dart';

import '../../../domain/entities/user.dart';
import '../../models/user_model.dart';

/// Defines the contract for local authentication data operations.
abstract class AuthLocalDataSource {
  /// Caches the [user] locally.
  Future<void> cacheUser(User user);

  /// Clears the locally cached user data.
  Future<void> clearUserData();

  /// Checks if user data exists in local storage.
  Future<bool> isUserLoggedIn();
}
