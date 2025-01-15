// To parse this JSON data, do
//
//     final userProfileResponse = userProfileResponseFromJson(jsonString);

import 'dart:convert';

import 'package:user_repo/user_repo.dart';

UserProfileResponse userProfileResponseFromJson(Map<String, dynamic> str) =>
    UserProfileResponse.fromJson(str);

String userProfileResponseToJson(UserProfileResponse data) =>
    json.encode(data.toJson());

class UserProfileResponse {
  bool status;
  UserProfile user;

  UserProfileResponse({
    required this.status,
    required this.user,
  });

  factory UserProfileResponse.fromJson(Map<String, dynamic> json) =>
      UserProfileResponse(
        status: json["status"],
        user: UserProfile.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "user": user.toJson(),
      };
}

class UserProfile {
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
  List<UserService> userServices;

  UserProfile({
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
    required this.userServices,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
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
        userServices: List<UserService>.from(
            json["UserServices"].map((x) => UserService.fromJson(x))),
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
        "UserServices": List<dynamic>.from(userServices.map((x) => x.toJson())),
      };
}
