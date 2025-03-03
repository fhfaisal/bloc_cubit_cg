import 'package:get_storage/get_storage.dart';

import '../../models/user_model.dart';
import 'auth_local_data_source.dart';
/// Concrete implementation of [AuthLocalDataSource] using GetStorage.
class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final GetStorage storage;
  static const String USER_KEY = 'cached_user';

  AuthLocalDataSourceImpl({required this.storage});

  @override
  Future<void> cacheUser(UserModel user) async {
    await storage.write(USER_KEY, user.toJson());
  }

  @override
  Future<void> clearUserData() async {
    await storage.remove(USER_KEY);
  }

  @override
  Future<bool> isUserLoggedIn() async {
    return storage.hasData(USER_KEY);
  }
}
