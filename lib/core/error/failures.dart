import 'package:dio/dio.dart';
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

Failure handleError(dynamic error) {
  if (error is DioException) {
    if (error.response != null) {
      final statusCode = error.response!.statusCode;
      final message = error.response!.data['message'] ?? "Something went wrong.";
      switch (statusCode) {
        case 400:
          return BadRequestFailure(message);
        case 401:
          return UnauthorizedFailure(message);
        case 403:
          return ForbiddenFailure(message);
        case 404:
          return NotFoundFailure(message);
        case 408:
          return TimeoutFailure(message);
        case 500:
          return ServerFailure(message);
        default:
          return UnknownFailure(message);
      }
    } else {
      // No response means it's likely a connection error
      return NetworkFailure("No Internet Connection");
    }
  }
  // If it's not a DioException, return an unknown failure
  return UnknownFailure("Unexpected error occurred.");
}
