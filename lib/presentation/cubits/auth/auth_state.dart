import 'package:equatable/equatable.dart';

import '../../../domain/entities/user.dart';

/// Abstract class representing the various states for authentication.
abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

/// Initial state when no action has been taken.
class AuthInitial extends AuthState {}

/// Loading state while an authentication action is in progress.
class AuthLoading extends AuthState {}

/// State when the user has been successfully authenticated.
class AuthAuthenticated extends AuthState {
  final User user;

  const AuthAuthenticated({required this.user});

  @override
  List<Object?> get props => [user];
}

/// State when an error occurs during an authentication operation.
class AuthError extends AuthState {
  final String message;

  const AuthError(this.message);

  @override
  List<Object?> get props => [message];
}
