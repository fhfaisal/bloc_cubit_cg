import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  const Failure(this.message);

  String get displayMessage => message;

  @override
  List<Object> get props => [message];
}

// Network-related failures
class NetworkFailure extends Failure {
  const NetworkFailure([super.message = "No Internet Connection"]);
}

class ServerFailure extends Failure {
  const ServerFailure([super.message = "Server Error"]);
}

class BadRequestFailure extends Failure {
  const BadRequestFailure([super.message = "Invalid Request"]);
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure([super.message = "Authentication Required"]);
}

class ForbiddenFailure extends Failure {
  const ForbiddenFailure([super.message = "Access Denied"]);
}

class NotFoundFailure extends Failure {
  const NotFoundFailure([super.message = "Resource Not Found"]);
}

class TimeoutFailure extends Failure {
  const TimeoutFailure([super.message = "Request Timed Out"]);
}

// Local storage failures
class CacheFailure extends Failure {
  const CacheFailure([super.message = "Storage Operation Failed"]);
}

// Authentication failures
class AuthenticationFailure extends Failure {
  const AuthenticationFailure([super.message = "Invalid Credentials"]);
}

// Fallback failure
class UnknownFailure extends Failure {
  const UnknownFailure([super.message = "Unknown Error Occurred"]);
}