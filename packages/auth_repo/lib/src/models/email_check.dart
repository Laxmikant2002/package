import 'dart:convert';

EmailCheckRequest emailCheckRequestFromJson(String str) =>
    EmailCheckRequest.fromJson(json.decode(str));

String emailCheckRequestToJson(EmailCheckRequest data) =>
    json.encode(data.toJson());

class EmailCheckRequest {
  String email;

  EmailCheckRequest({
    required this.email,
  });

  factory EmailCheckRequest.fromJson(Map<String, dynamic> json) =>
      EmailCheckRequest(
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
      };
}
