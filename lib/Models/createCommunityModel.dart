// To parse this JSON data, do
//
//     final createCommunityModel = createCommunityModelFromJson(jsonString);

import 'dart:convert';

CreateCommunityModel createCommunityModelFromJson(str) =>
    CreateCommunityModel.fromJson(str);

// String createCommunityModelToJson(CreateCommunityModel data) =>
//     json.encode(data.toJson());

class CreateCommunityModel {
  CreateCommunityModel({
    required this.community,
  });

  Community community;

  factory CreateCommunityModel.fromJson(Map<String, dynamic> json) =>
      CreateCommunityModel(
        community: Community.fromJson(json["community"]),
      );

  // Map<String, dynamic> toJson() => {
  //       "community": community.toJson(),
  //     };
}

class Community {
  Community({
    required this.isPublic,
    required this.name,
    required this.description,
    required this.picture,
    required this.users,
    required this.createdAt,
    required this.id,
  });

  bool isPublic;
  String name;
  String description;
  String picture;
  List<User> users;
  DateTime createdAt;
  String id;

  factory Community.fromJson(Map<String, dynamic> json) => Community(
        isPublic: json["isPublic"],
        name: json["name"],
        description: json["description"],
        picture: json["picture"],
        users: List<User>.from(json["users"].map((x) => User.fromJson(x))),
        createdAt: DateTime.parse(json["createdAt"]),
        id: json["id"],
      );

  // Map<String, dynamic> toJson() => {
  //       "isPublic": isPublic,
  //       "name": name,
  //       "description": description,
  //       "picture": picture,
  //       "users": List<dynamic>.from(users.map((x) => x.toJson())),
  //       "createdAt": createdAt.toIso8601String(),
  //       "id": id,
  //     };
}

class User {
  User({
    required this.role,
    this.name,
    this.email,
    this.createdAt,
    required this.id,
  });

  String role;
  String? name;
  String? email;
  DateTime? createdAt;
  String id;

  factory User.fromJson(Map<String, dynamic> json) => User(
        role: json["role"],
        name: json["name"],
        email: json["email"],
        createdAt: DateTime.parse(json["createdAt"]),
        id: json["id"],
      );

  // Map<String, dynamic> toJson() => {
  //       "role": role,
  //       "name": name,
  //       "email": email,
  //       "createdAt": createdAt.toIso8601String(),
  //       "id": id,
  //     };
}
