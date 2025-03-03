import 'dart:developer';
import 'dart:io';
import 'package:cubit_bloc/core/utils/debug/log_read.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../error/exceptions.dart';
import 'api_constants.dart';

/// API client with secure authentication, network handling, and pretty logging.
class DioClient {
  late final Dio _dio;

  DioClient() {
    _dio = Dio();

    _dio
      ..options.baseUrl = ApiConstants.baseUrl
      ..options.headers = {
        HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
        HttpHeaders.authorizationHeader: 'Bearer ${''}',
      }
      ..options.connectTimeout = const Duration(milliseconds: 15000)
      ..options.receiveTimeout = const Duration(milliseconds: 15000)
      ..options.responseType = ResponseType.json
      ..httpClientAdapter = _getHttpClientAdapter(); // <-- Add this line

    // Pretty Logger
    _dio.interceptors.add(
      PrettyDioLogger(
        compact: false,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        logPrint: (object) => log(object.toString(), name: 'FAISAL'),
      ),
    );
  }

  /// Allows self-signed SSL certificates (for testing only)
  HttpClientAdapter _getHttpClientAdapter() {
    return IOHttpClientAdapter()
      ..onHttpClientCreate = (client) {
        client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
        return client;
      };
  }

  /// Handles API responses and checks for errors.
  dynamic _handleResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        return response.data;
      case 201:
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

  /// * GET
  Future<dynamic> get(String url, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.get(url, queryParameters: queryParameters);
      return _handleResponse(response);
    } catch (e) {
      logView("GET request error: $e");
      throw _handleDioError(e as DioException);
    }
  }

  /// * POST
  Future<dynamic> post(String uri, {dynamic data}) async {
    try {
      final response = await _dio.post(uri, data: data);
      return response;
    } catch (e) {
      logView("POST request error: $e");
      throw _handleDioError(e as DioException);
    }
  }

  /// * PUT
  Future<dynamic> put(String uri, {dynamic data}) async {
    try {
      final response = await _dio.put(uri, data: data);
      return response;
    } catch (e) {
      logView("PUT request error: $e");
      throw _handleDioError(e as DioException);
    }
  }

  /// * PATCH
  Future<dynamic> patch(String uri, {dynamic data}) async {
    try {
      final response = await _dio.patch(uri, data: data);
      return response;
    } catch (e) {
      logView("PATCH request error: $e");
      throw _handleDioError(e as DioException);
    }
  }

  /// * DELETE
  Future<dynamic> delete(String uri, {dynamic data}) async {
    try {
      final response = await _dio.delete(uri, data: data);
      return response;
    } catch (e) {
      logView("DELETE request error: $e");
      throw _handleDioError(e as DioException);
    }
  }
}
