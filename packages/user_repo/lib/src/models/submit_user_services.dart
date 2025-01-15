import 'dart:convert';

SubmitUserServicesRequest submitUserServicesRequestFromJson(String str) =>
    SubmitUserServicesRequest.fromJson(json.decode(str));

String submitUserServicesRequestToJson(SubmitUserServicesRequest data) =>
    json.encode(data.toJson());

class SubmitUserServicesRequest {
  List<UserService> data;

  SubmitUserServicesRequest({
    required this.data,
  });

  factory SubmitUserServicesRequest.fromJson(Map<String, dynamic> json) =>
      SubmitUserServicesRequest(
        data: List<UserService>.from(
            json["data"].map((x) => UserService.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class UserService {
  String title;
  String description;

  UserService({
    required this.title,
    required this.description,
  });

  factory UserService.fromJson(Map<String, dynamic> json) => UserService(
        title: json["industryId"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "industryId": title,
        "description": description,
      };
}

SubmitUserServicesResponse submitUserServicesResponseFromJson(String str) =>
    SubmitUserServicesResponse.fromJson(json.decode(str));

String submitUserServicesResponseToJson(SubmitUserServicesResponse data) =>
    json.encode(data.toJson());

class SubmitUserServicesResponse {
  bool status;
  List<UserServiceRes> data;

  SubmitUserServicesResponse({
    required this.status,
    required this.data,
  });

  factory SubmitUserServicesResponse.fromJson(Map<String, dynamic> json) =>
      SubmitUserServicesResponse(
        status: json["status"],
        data: List<UserServiceRes>.from(
            json["data"].map((x) => UserServiceRes.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class UserServiceRes {
  String id;
  String industryId;
  String description;
  String userId;
  DateTime createdAt;
  DateTime updatedAt;

  UserServiceRes({
    required this.id,
    required this.industryId,
    required this.description,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserServiceRes.fromJson(Map<String, dynamic> json) => UserServiceRes(
        id: json["id"],
        industryId: json["industryId"],
        description: json["description"],
        userId: json["userId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "industryId": industryId,
        "description": description,
        "userId": userId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
