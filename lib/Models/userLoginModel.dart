import 'dart:convert';

UserLoginModel userLoginModelFromJson(str) => UserLoginModel.fromJson(str);

String userLoginModelToJson(UserLoginModel data) => json.encode(data.toJson());

class UserLoginModel {
  UserLoginModel({
    required this.token,
    required this.user,
  });

  Token token;
  User user;

  factory UserLoginModel.fromJson(Map<String, dynamic> json) => UserLoginModel(
        token: Token.fromJson(json["token"]),
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token.toJson(),
        "user": user.toJson(),
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

class User {
  User({
    required this.role,
    required this.picture,
    required this.name,
    required this.email,
    required this.createdAt,
    required this.id,
  });

  String role;
  String picture;
  String name;
  String email;
  DateTime createdAt;
  String id;

  factory User.fromJson(Map<String, dynamic> json) => User(
        role: json["role"],
        picture: json["picture"],
        name: json["name"],
        email: json["email"],
        createdAt: DateTime.parse(json["createdAt"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "role": role,
        "picture": picture,
        "name": name,
        "email": email,
        "createdAt": createdAt.toIso8601String(),
        "id": id,
      };
}
