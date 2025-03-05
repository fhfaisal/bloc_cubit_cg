import 'package:cubit_bloc/core/network/api_client.dart';
import 'package:cubit_bloc/domain/usecases/auth/auth_usecase.dart';
import 'package:cubit_bloc/presentation/cubits/auth/auth_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';

import '../../data/repositories/auth_repository_impl.dart';
import '../../data/sources/local/auth_local_data_source.dart';
import '../../data/sources/local/auth_local_data_source_impl.dart';
import '../../data/sources/remote/auth_remote_data_source.dart';
import '../../data/sources/remote/auth_remote_data_source_impl.dart';
import '../../domain/repositories/auth_repository.dart';
import '../utils/theme/cubit/theme_cubit.dart';

/// Service locator instance
final injector = GetIt.instance;

Future<void> init() async {
  //* External Dependencies
  await GetStorage.init();
  injector
    ..registerLazySingleton<GetStorage>(GetStorage.new)
    ..registerLazySingleton<DioClient>(DioClient.new)

  //* Data Sources
    ..registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(injector()))
    ..registerLazySingleton<AuthLocalDataSource>(() => AuthLocalDataSourceImpl())

  //* Repositories
    ..registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
      remoteDataSource: injector(),
      localDataSource: injector(),
    ))

  //* UseCases
    ..registerLazySingleton<AuthUseCase>(() => AuthUseCase(injector()))

  //* Cubits
    ..registerLazySingleton<ThemeCubit>(ThemeCubit.new)
    ..registerFactory<AuthCubit>(() => AuthCubit(injector()));
}
