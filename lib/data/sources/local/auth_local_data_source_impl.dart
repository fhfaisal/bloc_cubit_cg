import 'package:cubit_bloc/core/storage/storage_service.dart';
import 'package:cubit_bloc/domain/entities/user.dart';
import 'auth_local_data_source.dart';
/// Concrete implementation of [AuthLocalDataSource] using GetStorage.
class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final storage=StorageService();

  @override
  Future<void> cacheUser(User user) async {
    await storage.saveUserData(user);
  }

  @override
  Future<void> clearUserData() async {
    await storage.clearAllData();
  }

  @override
  Future<bool> isUserLoggedIn() async {
    return storage.isLoggedIn();
  }
}
