import 'package:dartz/dartz.dart';

import '../error/exceptions.dart';
import '../error/failures.dart';

Future<Either<Failure, T>> safeApiCall<T>(
    Future<T> Function() apiCall,
    ) async {
  try {
    final result = await apiCall();
    return Right(result);
  } on AppException catch (e) {
    // Map known exceptions to specific Failures
    if (e is UnauthorizedException) {
      return Left(AuthenticationFailure(e.message));
    } else if (e is BadRequestException) {
      return Left(BadRequestFailure(e.message));
    } else if (e is ServerException) {
      return Left(ServerFailure(e.message));
    } else if (e is NetworkException) {
      return Left(NetworkFailure(e.message));
    } else if (e is NotFoundException) {
      return Left(NotFoundFailure(e.message));
    } else if (e is TimeoutException) {
      return Left(TimeoutFailure(e.message));
    } else {
      return Left(UnknownFailure(e.message));
    }
  } catch (e) {
    return Left(UnknownFailure("Unexpected error occurred."));
  }
}
