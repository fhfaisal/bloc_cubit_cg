import 'package:cubit_bloc/core/network/api_client.dart';
import 'package:cubit_bloc/data/repositories/search/search_repository_impl.dart';
import 'package:cubit_bloc/data/sources/remote/search/search_remote_data_source.dart';
import 'package:cubit_bloc/data/sources/remote/search/search_remote_data_source_impl.dart';
import 'package:cubit_bloc/domain/repositories/search/search_repository.dart';
import 'package:cubit_bloc/domain/usecases/auth/auth_usecase.dart';
import 'package:cubit_bloc/domain/usecases/auth/search_usecase.dart';
import 'package:cubit_bloc/presentation/cubits/auth/auth_cubit.dart';
import 'package:cubit_bloc/presentation/cubits/search/search_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';

import 'data/repositories/auth/auth_repository_impl.dart';
import 'data/sources/local/auth_local_data_source.dart';
import 'data/sources/local/auth_local_data_source_impl.dart';
import 'data/sources/remote/auth/auth_remote_data_source.dart';
import 'data/sources/remote/auth/auth_remote_data_source_impl.dart';
import 'domain/repositories/auth/auth_repository.dart';
import 'core/utils/theme/cubit/theme_cubit.dart';

/// Service locator instance
final injector = GetIt.instance;

Future<void> init() async {
  //* External Dependencies
  await GetStorage.init();
  injector
    ..registerLazySingleton<GetStorage>(GetStorage.new)
    ..registerLazySingleton<DioClient>(DioClient.new)

    ///* Data Sources
    //Auth
    ..registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(injector()))
    ..registerLazySingleton<AuthLocalDataSource>(() => AuthLocalDataSourceImpl())
    //Search
    ..registerLazySingleton<SearchRemoteDataSource>(() => SearchRemoteDataSourceImpl(injector()))

    //* Repositories
    ..registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(remoteDataSource: injector(), localDataSource: injector()))
    ..registerLazySingleton<SearchRepository>(() => SearchRepositoryImpl(injector()))

    //* UseCases
    ..registerLazySingleton<AuthUseCase>(() => AuthUseCase(injector()))
    ..registerLazySingleton<SearchUseCase>(() => SearchUseCase(injector()))

    //* Cubits
    ..registerLazySingleton<ThemeCubit>(ThemeCubit.new)
    ..registerFactory<AuthCubit>(() => AuthCubit(injector()))
    ..registerFactory<SearchCubit>(() => SearchCubit(injector()));
}
