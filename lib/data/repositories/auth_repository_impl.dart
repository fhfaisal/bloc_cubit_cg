import 'package:dartz/dartz.dart';

import '../../core/error/exceptions.dart';
import '../../core/error/failures.dart';
import '../../core/network/safe_api_call.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../sources/local/auth_local_data_source.dart';
import '../sources/remote/auth_remote_data_source.dart';

/// Concrete implementation of [AuthRepository].
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, User>> signIn(String email, String password) async {
    return safeApiCall<User>(() async {
      final userModel = await remoteDataSource.signIn(email: email, password: password);
      await localDataSource.cacheUser(userModel);
      return userModel.user != null ? userModel.user! : userModel.toEntity();
    });
  }


  @override
  Future<Either<Failure, User>> signUp(String email, String password) async {
    try {
      // Call the remote data source to sign up.
      final userModel = await remoteDataSource.signUp(email: email, password: password);
      // Cache the user locally.
      await localDataSource.cacheUser(userModel);
      // Return the domain entity.
      return Right(userModel.user != null ? userModel.user! : userModel.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on AuthenticationException catch (e) {
      return Left(AuthenticationFailure(e.message));
    } catch (e) {
      return Left(UnknownFailure("Unexpected error occurred during sign up."));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      // Call the remote data source to sign out.
      await remoteDataSource.signOut();
      // Clear the cached user data.
      await localDataSource.clearUserData();
      return Right(null);
    } catch (e) {
      return Left(UnknownFailure("Sign out failed."));
    }
  }

  @override
  Future<Either<Failure, bool>> isUserLoggedIn() async {
    try {
      final loggedIn = await localDataSource.isUserLoggedIn();
      return Right(loggedIn);
    } catch (e) {
      return Left(CacheFailure("Failed to retrieve user session."));
    }
  }
}
