// To parse this JSON data, do
//
//     final getCommunitiesModel = getCommunitiesModelFromJson(jsonString);

import 'dart:convert';

GetCommunitiesModel getCommunitiesModelFromJson(str) =>
    GetCommunitiesModel.fromJson(str);

String getCommunitiesModelToJson(GetCommunitiesModel data) =>
    json.encode(data.toJson());

class GetCommunitiesModel {
  GetCommunitiesModel({
    required this.communities,
  });

  List<Community> communities;

  factory GetCommunitiesModel.fromJson(Map<String, dynamic> json) =>
      GetCommunitiesModel(
        communities: List<Community>.from(
            json["communities"].map((x) => Community.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "communities": List<dynamic>.from(communities.map((x) => x.toJson())),
      };
}

class Community {
  Community({
    required this.isPublic,
    required this.name,
    required this.description,
    required this.picture,
    required this.createdAt,
    required this.id,
  });

  bool isPublic;
  String name;
  String description;
  String picture;
  DateTime createdAt;
  String id;

  factory Community.fromJson(Map<String, dynamic> json) => Community(
        isPublic: json["isPublic"],
        name: json["name"],
        description: json["description"],
        picture: json["picture"],
        createdAt: DateTime.parse(json["createdAt"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "isPublic": isPublic,
        "name": name,
        "description": description,
        "picture": picture,
        "createdAt": createdAt.toIso8601String(),
        "id": id,
      };
}
