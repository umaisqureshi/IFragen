// To parse this JSON data, do
//
//     final getAccessTokenModel = getAccessTokenModelFromJson(jsonString);

import 'dart:convert';

GetAccessTokenModel getAccessTokenModelFromJson(str) =>
    GetAccessTokenModel.fromJson(str);

String getAccessTokenModelToJson(GetAccessTokenModel data) =>
    json.encode(data.toJson());

class GetAccessTokenModel {
  GetAccessTokenModel({
    required this.tokenType,
    required this.accessToken,
    required this.refreshToken,
    required this.expiresIn,
  });

  String tokenType;
  String accessToken;
  String refreshToken;
  DateTime expiresIn;

  factory GetAccessTokenModel.fromJson(Map<String, dynamic> json) =>
      GetAccessTokenModel(
        tokenType: json["tokenType"],
        accessToken: json["accessToken"],
        refreshToken: json["refreshToken"],
        expiresIn: DateTime.parse(json["expiresIn"]),
      );

  Map<String, dynamic> toJson() => {
        "tokenType": tokenType,
        "accessToken": accessToken,
        "refreshToken": refreshToken,
        "expiresIn": expiresIn.toIso8601String(),
      };
}
