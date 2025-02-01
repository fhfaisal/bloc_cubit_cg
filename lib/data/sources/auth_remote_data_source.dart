import 'dart:convert';
import 'package:cubit_bloc/core/network/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../core/error/exceptions.dart';
import '../models/user_model.dart';

/// Defines the contract for remote authentication operations.
abstract class AuthRemoteDataSource {
  /// Sends a sign in request and returns a [UserModel] on success.
  Future<UserModel> signIn(String email, String password);

  /// Sends a sign up request and returns a [UserModel] on success.
  Future<UserModel> signUp(String email, String password);

  /// Sends a sign out request.
  Future<void> signOut();
}

/// Concrete implementation of [AuthRemoteDataSource] using Dio.
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSourceImpl({required this.dio});

  @override
  Future<UserModel> signIn(String email, String password) async {
    try {
      final response = await dio.post(
        ApiConstants.login,
        data: {
          "email": email,
          "password": password,
        },
      );

      if (kDebugMode) {
        print("Response Data: ${response.data}");
      } // Debugging Line

      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data);
      } else {
        throw ServerException(response.data['message'] ?? "Failed to sign in.");
      }
    } on DioException catch (e) {
      print("Dio Error: ${e.response?.data}"); // Debugging Line
      throw ServerException(e.response?.data['message'] ?? "Server error during sign in.");
    }
  }

  @override
  Future<UserModel> signUp(String email, String password) async {
    try {
      final response = await dio.post(
        ApiConstants.register,
        data: jsonEncode({
          "email": email,
          "password": password,
        }),
      );

      // Assuming a 201 status code for successful signup.
      if (response.statusCode == 200 || response.statusCode == 201) {
        return UserModel.fromJson(response.data);
      } else {
        throw ServerException(response.data['message'] ?? "Failed to sign up.");
      }
    } on DioException catch (e) {
      throw ServerException(e.response?.data['message'] ?? "Server error during sign up.");
    }
  }

  @override
  Future<void> signOut() async {
    try {
      final response = await dio.post("/auth/signout");
      if (response.statusCode != 200) {
        throw ServerException(response.data['message'] ?? "Failed to sign out.");
      }
    } on DioException catch (e) {
      throw ServerException(e.response?.data['message'] ?? "Server error during sign out.");
    }
  }
}
