// lib/core/error/exceptions.dart
/// Base class for all application exceptions
abstract class AppException implements Exception {
  final String message;
  const AppException([this.message = "An unexpected error occurred"]);
}

/// Exception thrown when there's no internet connection
class NetworkException extends AppException {
  const NetworkException([super.message = "No Internet Connection"]);
}

/// Exception thrown for server errors (5xx status codes)
class ServerException extends AppException {
  const ServerException([super.message = "Server Error"]);
}

/// Exception thrown for bad requests (400 status code)
class BadRequestException extends AppException {
  const BadRequestException([super.message = "Bad Request"]);
}

/// Exception thrown for unauthorized access (401 status code)
class UnauthorizedException extends AppException {
  const UnauthorizedException([super.message = "Unauthorized"]);
}

/// Exception thrown for forbidden access (403 status code)
class ForbiddenException extends AppException {
  const ForbiddenException([super.message = "Access Denied"]);
}

/// Exception thrown for resource not found (404 status code)
class NotFoundException extends AppException {
  const NotFoundException([super.message = "Resource Not Found"]);
}

/// Exception thrown for request timeouts (408 status code)
class TimeoutException extends AppException {
  const TimeoutException([super.message = "Request Timed Out"]);
}

/// Exception thrown for local cache operations failures
class CacheException extends AppException {
  const CacheException([super.message = "Cache Operation Failed"]);
}

/// Fallback exception for unknown errors
class UnknownException extends AppException {
  const UnknownException([super.message = "An unknown error occurred"]);
}
/// Exception thrown when a user is not authorized to access a resource (403 status code).
class AuthenticationException implements Exception {
  final String message;

  /// Default message: "Authentication Failed"
  AuthenticationException([this.message = "Authentication Failed"]);
}