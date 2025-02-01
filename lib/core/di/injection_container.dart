
import 'package:cubit_bloc/presentation/cubits/auth/auth_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../data/repositories/auth_repository_impl.dart';
import '../../data/sources/auth_local_data_source.dart';
import '../../data/sources/auth_remote_data_source.dart';
import '../../domain/repositories/auth_repository.dart';
import '../network/dio_config.dart';

final sl = GetIt.instance; // sl = service locator

Future<void> setupDependencies() async {
  // Initialize local storage before registering dependencies
  await GetStorage.init();

  /// ============================
  /// External Dependencies
  /// ============================
  sl.registerLazySingleton<GetStorage>(() => GetStorage());

  sl.registerLazySingleton<Dio>(() {
    final dio = createDio();
    dio.interceptors.add(PrettyDioLogger(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      error: true,
      compact: true,
      maxWidth: 90,
    ));
    return dio;
  });

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

