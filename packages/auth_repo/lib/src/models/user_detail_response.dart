import 'dart:convert';

UserDetailResponse userAboutResponseFromJson(String str) =>
    UserDetailResponse.fromJson(json.decode(str));

String userAboutResponseToJson(UserDetailResponse data) =>
    json.encode(data.toJson());

class UserDetailResponse {
  bool status;
  User user;

  UserDetailResponse({
    required this.status,
    required this.user,
  });

  factory UserDetailResponse.fromJson(Map<String, dynamic> json) =>
      UserDetailResponse(
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
  String firstName;
  String lastName;
  String role;
  String language;
  int status;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  UserDetail? userDetail; // Nullable UserDetail

  User({
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
    this.userDetail, // Nullable UserDetail
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
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
        userDetail: json["UserDetail"] != null
            ? UserDetail.fromJson(json["UserDetail"])
            : null, // Handle null UserDetail
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
        "UserDetail": userDetail?.toJson(), // Nullable UserDetail
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
