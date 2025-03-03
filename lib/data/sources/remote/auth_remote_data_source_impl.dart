import 'dart:convert';
import 'package:cubit_bloc/core/network/api_client.dart';
import 'package:cubit_bloc/core/network/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../core/error/exceptions.dart';
import '../../models/user_model.dart';
import 'auth_remote_data_source.dart';

/// Concrete implementation of [AuthRemoteDataSource] using Dio.
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final DioClient _dioClient;

  AuthRemoteDataSourceImpl(this._dioClient);

  @override
  Future<UserModel> signIn({required String email, required String password}) async {
    try {
      final response = await _dioClient.post(
        ApiConstants.login,
        data: {"email": email, "password": password},
      );
      final model = UserModel.fromJson(response.data as Map<String, dynamic>);
      return model;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<UserModel> signUp({required String email, required String password}) async {
    try {
      final response = await _dioClient.post(
        ApiConstants.register,
        data: {"email": email, "password": password},
      );
      final model = UserModel.fromJson(response.data as Map<String, dynamic>);
      return model;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      final response = await _dioClient.post("/auth/signout");
      if (response.statusCode != 200) {
        throw ServerException(response.data['message'] ?? "Failed to sign out.");
      }
    } on DioException catch (e) {
      throw ServerException(e.response?.data['message'] ?? "Server error during sign out.");
    }
  }
}
