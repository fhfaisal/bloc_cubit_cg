// lib/data/models/user_model.dart
import 'dart:convert';
import 'package:equatable/equatable.dart';

import '../../domain/entities/user.dart';

class UserModel extends Equatable {
  final String? success;
  final String? message;
  final User? user;

  const UserModel({
    this.success,
    this.message,
    this.user,
  });

  factory UserModel.fromRawJson(String str) => UserModel.fromJson(json.decode(str));

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        success: json["success"],
        message: json["message"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "user": user?.toJson(),
      };

  User toEntity() => User(
        id: user!.id,
        email: user!.email,
        name: user!.name,
        token: user!.token,
        accountType: user!.accountType,
      );

  String toRawJson() => json.encode(toJson());

  UserModel copyWith({
    String? success,
    String? message,
    User? user,
  }) =>
      UserModel(
        success: success ?? this.success,
        message: message ?? this.message,
        user: user ?? this.user,
      );

  @override
  List<Object?> get props => [success, message, user];
}


