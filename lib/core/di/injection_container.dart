
import 'package:cubit_bloc/presentation/cubits/auth/auth_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

import '../../data/repositories/auth_repository_impl.dart';
import '../../data/sources/auth_local_data_source.dart';
import '../../data/sources/auth_remote_data_source.dart';
import '../../domain/repositories/auth_repository.dart';

final sl = GetIt.instance; // sl = service locator

Future<void> setupDependencies() async {
  // Initialize local storage before registering dependencies
  await GetStorage.init();

  /// ============================
  /// External Dependencies
  /// ============================
  sl.registerLazySingleton<GetStorage>(() => GetStorage());

  /// ============================
  /// Data Sources
  /// ============================
  sl.registerLazySingleton<AuthRemoteDataSource>(
        () => AuthRemoteDataSourceImpl(dio: sl<Dio>()),
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

