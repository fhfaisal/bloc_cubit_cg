import 'package:bloc/bloc.dart';
import 'package:cubit_bloc/domain/usecases/auth/auth_usecase.dart';

import '../../../domain/repositories/auth_repository.dart';
import 'auth_state.dart';

/// [AuthCubit] is responsible for managing authentication state.
/// It interacts with the [AuthRepository] to perform sign in, sign up, and sign out operations.
class AuthCubit extends Cubit<AuthState> {
  final AuthUseCase authUseCase;

  /// The [authRepository] is injected so that [AuthCubit] can communicate with
  /// the data layer to perform authentication-related operations.
  AuthCubit(this.authUseCase) : super(AuthInitial());

  /// Attempts to sign in the user with the provided [email] and [password].
  /// Emits [AuthLoading] before starting the process and then either
  /// [AuthAuthenticated] on success or [AuthError] on failure.
  Future<void> signIn(String email, String password) async {
    emit(AuthLoading());
    final result = await authUseCase.signIn(email, password);
    result.fold(
          (failure) => emit(AuthError(failure.message)),
          (user) => emit(AuthAuthenticated(user: user)),
    );
  }

  /// Attempts to sign up a new user with the provided [email] and [password].
  /// Emits [AuthLoading] during the process and then either
  /// [AuthAuthenticated] on success or [AuthError] on failure.
  Future<void> signUp(String email, String password) async {
    emit(AuthLoading());
    final result = await authUseCase.signUp(email, password);
    result.fold(
          (failure) => emit(AuthError(failure.message)),
          (user) => emit(AuthAuthenticated(user:user)),
    );
  }

  /// Signs out the current user.
  /// Emits [AuthLoading] while processing and then returns to the [AuthInitial] state
  /// on success or emits [AuthError] on failure.
  Future<void> signOut() async {
    emit(AuthLoading());
    final result = await authUseCase.signOut();
    result.fold(
          (failure) => emit(AuthError(failure.message)),
          (_) => emit(AuthInitial()),
    );
  }
}
