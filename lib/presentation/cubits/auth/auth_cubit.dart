import 'package:bloc/bloc.dart';

import '../../../domain/repositories/auth_repository.dart';
import 'auth_state.dart';

/// [AuthCubit] is responsible for managing authentication state.
/// It interacts with the [AuthRepository] to perform sign in, sign up, and sign out operations.
class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;

  /// The [authRepository] is injected so that [AuthCubit] can communicate with
  /// the data layer to perform authentication-related operations.
  AuthCubit({required this.authRepository}) : super(AuthInitial());

  /// Attempts to sign in the user with the provided [email] and [password].
  /// Emits [AuthLoading] before starting the process and then either
  /// [AuthAuthenticated] on success or [AuthError] on failure.
  Future<void> signIn(String email, String password) async {
    emit(AuthLoading());
    final result = await authRepository.signIn(email, password);
    result.fold(
          (failure) => emit(AuthError(failure.message)),
          (user) => emit(AuthAuthenticated(user)),
    );
  }

  /// Attempts to sign up a new user with the provided [email] and [password].
  /// Emits [AuthLoading] during the process and then either
  /// [AuthAuthenticated] on success or [AuthError] on failure.
  Future<void> signUp(String email, String password) async {
    emit(AuthLoading());
    final result = await authRepository.signUp(email, password);
    result.fold(
          (failure) => emit(AuthError(failure.message)),
          (user) => emit(AuthAuthenticated(user)),
    );
  }

  /// Signs out the current user.
  /// Emits [AuthLoading] while processing and then returns to the [AuthInitial] state
  /// on success or emits [AuthError] on failure.
  Future<void> signOut() async {
    emit(AuthLoading());
    final result = await authRepository.signOut();
    result.fold(
          (failure) => emit(AuthError(failure.message)),
          (_) => emit(AuthInitial()),
    );
  }
}
