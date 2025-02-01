import 'dart:io';

import 'package:cubit_bloc/core/network/api_constants.dart';
import 'package:cubit_bloc/presentation/cubits/auth/auth_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'data/repositories/auth_repository_impl.dart';
import 'data/sources/auth_local_data_source.dart';
import 'data/sources/auth_remote_data_source.dart';
import 'domain/repositories/auth_repository.dart';

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

Dio createDio() {
  final dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl, // Replace with your base URL
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ),
  );

  // Bypass SSL certificate errors (for development only)
  (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
    final client = HttpClient();
    client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
    return client;
  };

  return dio;
}
