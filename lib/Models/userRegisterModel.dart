import 'dart:convert';

UserModel userModelFromJson(str) => UserModel.fromJson(str);

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.user,
  });

  User user;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
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
