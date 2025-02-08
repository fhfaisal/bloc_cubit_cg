import 'dart:convert';
import 'package:cubit_bloc/core/network/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../core/error/exceptions.dart';
import '../../core/network/api_client.dart';
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


/// Concrete implementation of [AuthRemoteDataSource] using ApiClient.
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient apiClient; // Use ApiClient instead of Dio

  AuthRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<UserModel> signIn(String email, String password) async {
    final response = await apiClient.postRequest(
      ApiConstants.login,
      data: {
        "email": email,
        "password": password,
      },
    );
    return UserModel.fromJson(response);
  }

  @override
  Future<UserModel> signUp(String email, String password) async {
    final response = await apiClient.postRequest(
      ApiConstants.register,
      data: {
        "email": email,
        "password": password,
      },
    );

    return UserModel.fromJson(response);
  }

  @override
  Future<void> signOut() async {
    await apiClient.postRequest("/auth/signout");
  }
}
