import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../../entities/user.dart';

/// Defines the contract for authentication operations.
abstract class AuthRepository {
  /// Signs in a user with [email] and [password] and returns a [User] entity on success.
  Future<Either<Failure, User>> signIn(String email, String password);

  /// Signs up a new user with [email] and [password] and returns a [User] entity on success.
  Future<Either<Failure, User>> signUp(String email, String password);

  /// Signs out the current user.
  Future<Either<Failure, void>> signOut();

  /// Checks if a user is currently logged in.
  Future<Either<Failure, bool>> isUserLoggedIn();
}
