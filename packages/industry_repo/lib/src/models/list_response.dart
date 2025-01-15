// To parse this JSON data, do
//
//     final industryListResponse = industryListResponseFromJson(jsonString);

import 'dart:convert';

IndustryListResponse industryListResponseFromJson(String str) =>
    IndustryListResponse.fromJson(json.decode(str));

String industryListResponseToJson(IndustryListResponse data) =>
    json.encode(data.toJson());

class IndustryListResponse {
  bool status;
  List<IndustryObject> data;

  IndustryListResponse({
    required this.status,
    required this.data,
  });

  factory IndustryListResponse.fromJson(Map<String, dynamic> json) =>
      IndustryListResponse(
        status: json["status"],
        data: List<IndustryObject>.from(
            json["data"].map((x) => IndustryObject.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class IndustryObject {
  String id;
  String name;

  IndustryObject({
    required this.id,
    required this.name,
  });

  factory IndustryObject.fromJson(Map<String, dynamic> json) => IndustryObject(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
