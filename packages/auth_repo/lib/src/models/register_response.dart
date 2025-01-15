import 'dart:convert';

RegisterResponse registerResponseFromJson(String str) =>
    RegisterResponse.fromJson(json.decode(str));

String registerResponseToJson(RegisterResponse data) =>
    json.encode(data.toJson());

class RegisterResponse {
  bool status;
  RegisteredUser user;

  RegisterResponse({
    required this.status,
    required this.user,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      RegisterResponse(
        status: json["status"],
        user: RegisteredUser.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "user": user.toJson(),
      };
}

class RegisteredUser {
  String id;
  String email;
  String password;
  int status;
  String name;
  String language;
  DateTime updatedAt;
  DateTime createdAt;

  RegisteredUser({
    required this.id,
    required this.email,
    required this.password,
    required this.status,
    required this.name,
    required this.language,
    required this.updatedAt,
    required this.createdAt,
  });

  factory RegisteredUser.fromJson(Map<String, dynamic> json) => RegisteredUser(
        id: json["id"],
        email: json["email"],
        password: json["password"],
        status: json["status"],
        name: json["name"],
        language: json["language"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "password": password,
        "status": status,
        "name": name,
        "language": language,
        "updatedAt": updatedAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
      };
}
