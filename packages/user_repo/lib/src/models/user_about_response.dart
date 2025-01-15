// To parse this JSON data, do
//
//     final userAboutResponse = userAboutResponseFromJson(jsonString);

import 'dart:convert';

UserAboutResponse userAboutResponseFromJson(String str) =>
    UserAboutResponse.fromJson(json.decode(str));

String userAboutResponseToJson(UserAboutResponse data) =>
    json.encode(data.toJson());

class UserAboutResponse {
  bool status;
  User user;

  UserAboutResponse({
    required this.status,
    required this.user,
  });

  factory UserAboutResponse.fromJson(Map<String, dynamic> json) =>
      UserAboutResponse(
        status: json["status"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "user": user.toJson(),
      };
}

class User {
  String id;
  String email;
  String password;
  dynamic emailVerifiedAt;
  String name;
  String language;
  int status;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  UserDetail userDetail;

  User({
    required this.id,
    required this.email,
    required this.password,
    required this.emailVerifiedAt,
    required this.name,
    required this.language,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.userDetail,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        password: json["password"],
        emailVerifiedAt: json["emailVerifiedAt"],
        name: json["name"],
        language: json["language"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
        userDetail: UserDetail.fromJson(json["UserDetail"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "password": password,
        "emailVerifiedAt": emailVerifiedAt,
        "name": name,
        "language": language,
        "status": status,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "deletedAt": deletedAt,
        "UserDetail": userDetail.toJson(),
      };
}

class UserDetail {
  int id;
  String description;
  String avatar;
  String userDetailUserId;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  String userId;

  UserDetail({
    required this.id,
    required this.description,
    required this.avatar,
    required this.userDetailUserId,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.userId,
  });

  factory UserDetail.fromJson(Map<String, dynamic> json) => UserDetail(
        id: json["id"],
        description: json["description"],
        avatar: json["avatar"],
        userDetailUserId: json["userId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
        userId: json["UserId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "avatar": avatar,
        "userId": userDetailUserId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "deletedAt": deletedAt,
        "UserId": userId,
      };
}
