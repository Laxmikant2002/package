import 'dart:convert';

AuthResponse authResponseFromJson(String str) =>
    AuthResponse.fromJson(json.decode(str));

String authResponseToJson(AuthResponse data) => json.encode(data.toJson());

class AuthResponse {
  String status;
  LoginUser user;
  String accessToken;

  AuthResponse({
    required this.status,
    required this.user,
    required this.accessToken,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
        status: json["status"],
        user: LoginUser.fromJson(json["user"]),
        accessToken: json["accessToken"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "user": user.toJson(),
        "accessToken": accessToken,
      };
}

class LoginUser {
  String id;
  String email;
  String password;
  dynamic emailVerifiedAt;
  String firstName;
  String lastName;
  String language;
  String role;
  int status;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  LoginUser({
    required this.id,
    required this.email,
    required this.password,
    required this.emailVerifiedAt,
    required this.firstName,
    required this.lastName,
    required this.language,
    required this.role,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory LoginUser.fromJson(Map<String, dynamic> json) => LoginUser(
        id: json["id"],
        email: json["email"],
        password: json["password"],
        emailVerifiedAt: json["emailVerifiedAt"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        language: json["language"],
        role: json["role"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "password": password,
        "emailVerifiedAt": emailVerifiedAt,
        "firstName": firstName,
        "lastName": lastName,
        "role": role,
        "language": language,
        "status": status,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "deletedAt": deletedAt,
      };
}
