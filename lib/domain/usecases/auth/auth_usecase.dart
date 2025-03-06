import '../../../core/error/failures.dart';
import '../../entities/user.dart';
import '../../repositories/auth/auth_repository.dart';

import 'package:dartz/dartz.dart';

class AuthUseCase {
  final AuthRepository authRepository;

  AuthUseCase(this.authRepository);

  /// Signs in a user with the given [email] and [password].
  Future<Either<Failure, User>> signIn(String email, String password) {
    return authRepository.signIn(email, password);
  }

  /// Signs up a new user with the given [email] and [password].
  Future<Either<Failure, User>> signUp(String email, String password) {
    return authRepository.signUp(email, password);
  }

  /// Signs out the current user.
  Future<Either<Failure, void>> signOut() {
    return authRepository.signOut();
  }

  /// Checks if a user is currently logged in.
  Future<Either<Failure, bool>> isUserLoggedIn() {
    return authRepository.isUserLoggedIn();
  }
}
