// To parse this JSON data, do
//
//     final createCommunityModel = createCommunityModelFromJson(jsonString);

import 'dart:convert';

CreateCommunityModel createCommunityModelFromJson(str) =>
    CreateCommunityModel.fromJson(str);

String createCommunityModelToJson(CreateCommunityModel data) =>
    json.encode(data.toJson());

class CreateCommunityModel {
  CreateCommunityModel({
    required this.community,
  });

  Community community;

  factory CreateCommunityModel.fromJson(Map<String, dynamic> json) =>
      CreateCommunityModel(
        community: Community.fromJson(json["community"]),
      );

  Map<String, dynamic> toJson() => {
        "community": community.toJson(),
      };
}

class Community {
  Community({
    required this.picture,
    required this.isPublic,
    required this.name,
    required this.description,
    required this.createdAt,
    required this.id,
  });

  String picture;
  bool isPublic;
  String name;
  String description;
  DateTime createdAt;
  String id;

  factory Community.fromJson(Map<String, dynamic> json) => Community(
        picture: json["picture"],
        isPublic: json["isPublic"],
        name: json["name"],
        description: json["description"],
        createdAt: DateTime.parse(json["createdAt"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "picture": picture,
        "isPublic": isPublic,
        "name": name,
        "description": description,
        "createdAt": createdAt.toIso8601String(),
        "id": id,
      };
}
