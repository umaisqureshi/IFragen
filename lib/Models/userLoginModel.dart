// To parse this JSON data, do
//
//     final userLoginModel = userLoginModelFromJson(jsonString);

import 'dart:convert';

UserLoginModel userLoginModelFromJson(str) => UserLoginModel.fromJson(str);

String userLoginModelToJson(UserLoginModel data) => json.encode(data.toJson());

class UserLoginModel {
    UserLoginModel({
        required this.token,
    });

    Token token;

    factory UserLoginModel.fromJson(Map<String, dynamic> json) => UserLoginModel(
        token: Token.fromJson(json["token"]),
    );

    Map<String, dynamic> toJson() => {
        "token": token.toJson(),
    };
}

class Token {
    Token({
        required this.tokenType,
        required this.accessToken,
        required this.refreshToken,
        required this.expiresIn,
    });

    String tokenType;
    String accessToken;
    String refreshToken;
    DateTime expiresIn;

    factory Token.fromJson(Map<String, dynamic> json) => Token(
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
