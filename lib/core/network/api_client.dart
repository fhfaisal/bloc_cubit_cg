// import 'dart:convert';
// import 'package:dio/dio.dart';
// import 'package:pretty_dio_logger/pretty_dio_logger.dart';
//
// import '../error/exceptions.dart';
// import '../storage/secure_storage.dart';
// import 'api_interceptor.dart';
// import 'network_info.dart';
//
// /// API client with secure authentication, network handling, and pretty logging.
// class ApiClient {
//   final Dio dio;
//   final NetworkInfo networkInfo;
//   final SecureStorage secureStorage;
//
//   ApiClient({
//     required this.dio,
//     required this.networkInfo,
//     required this.secureStorage,
//   }) {
//     // Add the authentication interceptor
//     dio.interceptors.add(ApiInterceptor(dio: dio, secureStorage: secureStorage));
//
//     // Add PrettyDioLogger for logging HTTP requests and responses.
//     dio.interceptors.add(
//       PrettyDioLogger(
//         requestHeader: true,
//         requestBody: true,
//         responseBody: true,
//         responseHeader: false,
//         compact: true,
//         maxWidth: 90,
//       ),
//     );
//   }
//
//   /// Performs a GET request.
//   Future<dynamic> getRequest(String url, {Map<String, dynamic>? queryParams}) async {
//     if (!await networkInfo.isConnected) {
//       throw NetworkException("No Internet connection.");
//     }
//     try {
//       final response = await dio.get(url, queryParameters: queryParams);
//       return _handleResponse(response);
//     } on DioException catch (e) {
//       throw _handleDioError(e);
//     }
//   }
//
//   /// Performs a POST request.
//   Future<dynamic> postRequest(String url, {Map<String, dynamic>? data}) async {
//     if (!await networkInfo.isConnected) {
//       throw NetworkException("No Internet connection.");
//     }
//     try {
//       final response = await dio.post(url, data: jsonEncode(data));
//       return _handleResponse(response);
//     } on DioException catch (e) {
//       throw _handleDioError(e);
//     }
//   }
//
//   /// Handles API responses and checks for errors.
//   dynamic _handleResponse(Response response) {
//     switch (response.statusCode) {
//       case 200:
//         return response.data;
//       case 400:
//         throw BadRequestException(response.data['message']);
//       case 401:
//         throw UnauthorizedException(response.data['message']);
//       case 403:
//         throw AuthenticationException(response.data['message']);
//       case 404:
//         throw NotFoundException(response.data['message']);
//       case 408:
//         throw TimeoutException(response.data['message']);
//       case 500:
//         throw ServerException(response.data['message']);
//       default:
//         throw UnknownException("Something went wrong.");
//     }
//   }
//
//   /// Converts DioException to our custom exceptions.
//   Exception _handleDioError(DioException e) {
//     if (e.response != null) {
//       return _handleResponse(e.response!);
//     } else {
//       return NetworkException("No Internet connection.");
//     }
//   }
// }
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../error/exceptions.dart';
import '../storage/secure_storage.dart';
import 'api_interceptor.dart';
import 'network_info.dart';

/// API client with secure authentication, network handling, and pretty logging.
class ApiClient {
  final Dio _dio;
  final NetworkInfo _networkInfo;
  final SecureStorage _secureStorage;

  // Private constructor to prevent direct instantiation
  ApiClient._internal({
    required Dio dio,
    required NetworkInfo networkInfo,
    required SecureStorage secureStorage,
  })  : _dio = dio,
        _networkInfo = networkInfo,
        _secureStorage = secureStorage {
    // Add the authentication interceptor
    _dio.interceptors.add(ApiInterceptor(dio: _dio, secureStorage: _secureStorage));

    // Add PrettyDioLogger for logging HTTP requests and responses.
    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        compact: true,
        maxWidth: 90,
      ),
    );
  }

  // Factory constructor to create an instance using GetIt
  factory ApiClient() {
    return ApiClient._internal(
      dio: GetIt.instance<Dio>(),
      networkInfo: GetIt.instance<NetworkInfo>(),
      secureStorage: GetIt.instance<SecureStorage>(),
    );
  }

  /// Performs a GET request.
  Future<dynamic> getRequest(String url, {Map<String, dynamic>? queryParams}) async {
    if (!await _networkInfo.isConnected) {
      throw NetworkException("No Internet connection.");
    }
    try {
      final response = await _dio.get(url, queryParameters: queryParams);
      return _handleResponse(response);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  /// Performs a POST request.
  Future<dynamic> postRequest(String url, {Map<String, dynamic>? data}) async {
    if (!await _networkInfo.isConnected) {
      throw NetworkException("No Internet connection.");
    }
    try {
      final response = await _dio.post(url, data: jsonEncode(data));
      return _handleResponse(response);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  /// Handles API responses and checks for errors.
  dynamic _handleResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        return response.data;
      case 400:
        throw BadRequestException(response.data['message']);
      case 401:
        throw UnauthorizedException(response.data['message']);
      case 403:
        throw AuthenticationException(response.data['message']);
      case 404:
        throw NotFoundException(response.data['message']);
      case 408:
        throw TimeoutException(response.data['message']);
      case 500:
        throw ServerException(response.data['message']);
      default:
        throw UnknownException("Something went wrong.");
    }
  }

  /// Converts DioException to our custom exceptions.
  Exception _handleDioError(DioException e) {
    if (e.response != null) {
      return _handleResponse(e.response!);
    } else {
      return NetworkException("No Internet connection.");
    }
  }
}
