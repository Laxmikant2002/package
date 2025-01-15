import 'dart:convert';

UserAboutRequest userAboutRequestFromJson(String str) =>
    UserAboutRequest.fromJson(json.decode(str));

String userAboutRequestToJson(UserAboutRequest data) =>
    json.encode(data.toJson());

class UserAboutRequest {
  String description;
  String avatar;

  UserAboutRequest({
    required this.description,
    required this.avatar,
  });

  factory UserAboutRequest.fromJson(Map<String, dynamic> json) =>
      UserAboutRequest(
        description: json["description"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "avatar": avatar,
      };
}
