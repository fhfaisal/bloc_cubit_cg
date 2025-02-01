import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String email;
  final String accountType;
  final String name;
  final String? firstName;
  final String? lastName;
  final String token;

  const User({
    required this.id,
    required this.email,
    required this.accountType,
    required this.name,
    this.firstName,
    this.lastName,
    required this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"] ?? 0,
    email: json["email"] ?? "",
    accountType: json["account_type"] ?? "",
    name: json["name"] ?? "",
    firstName: json["first_name"],
    lastName: json["last_name"],
    token: json["token"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "account_type": accountType,
    "name": name,
    "first_name": firstName,
    "last_name": lastName,
    "token": token,
  };

  User copyWith({
    int? id,
    String? email,
    String? accountType,
    String? name,
    String? firstName,
    String? lastName,
    String? token,
  }) =>
      User(
        id: id ?? this.id,
        email: email ?? this.email,
        accountType: accountType ?? this.accountType,
        name: name ?? this.name,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        token: token ?? this.token,
      );

  @override
  List<Object?> get props => [id, email, accountType, name, firstName, lastName, token];
}