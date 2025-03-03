
import 'package:cubit_bloc/core/network/api_client.dart';
import 'package:cubit_bloc/presentation/cubits/auth/auth_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';

import '../../data/repositories/auth_repository_impl.dart';
import '../../data/sources/local/auth_local_data_source.dart';
import '../../data/sources/local/auth_local_data_source_impl.dart';
import '../../data/sources/remote/auth_remote_data_source.dart';
import '../../data/sources/remote/auth_remote_data_source_impl.dart';
import '../../domain/repositories/auth_repository.dart';

final sl = GetIt.instance; // sl = service locator

Future<void> setupDependencies() async {
  // Initialize local storage before registering dependencies
  await GetStorage.init();

  /// ============================
  /// External Dependencies
  /// ============================
  sl.registerLazySingleton<GetStorage>(() => GetStorage());
  sl.registerLazySingleton<DioClient>(() => DioClient());

  /// ============================
  /// Data Sources
  /// ============================
  sl.registerLazySingleton<AuthRemoteDataSource>(
        () => AuthRemoteDataSourceImpl(sl<DioClient>()),
  );

  sl.registerLazySingleton<AuthLocalDataSource>(
        () => AuthLocalDataSourceImpl(storage: sl<GetStorage>()),
  );

  /// ============================
  /// Repositories
  /// ============================
  sl.registerLazySingleton<AuthRepository>(
        () => AuthRepositoryImpl(
      remoteDataSource: sl<AuthRemoteDataSource>(),
      localDataSource: sl<AuthLocalDataSource>(),
    ),
  );

  /// ============================
  /// Bloc / Cubit
  /// ============================
  sl.registerFactory(
        () => AuthCubit(authRepository: sl<AuthRepository>()),
  );
}

