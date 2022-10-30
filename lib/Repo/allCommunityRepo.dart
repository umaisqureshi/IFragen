import 'dart:convert';
import 'package:http/http.dart';
import 'package:ifragen/Constant/constant.dart';
import 'package:ifragen/Helper/helper.dart';
import 'package:ifragen/Models/getCommunitiesModel.dart';

import '../Models/createCommunityModel.dart';

class CommunityRepo {
  Future<GetCommunitiesModel> allCommunities() async {
    var token = await HelperClass.getUserAccessToken();

    Response response = await get(Uri.parse(ALL_COMMUNITIES), headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200 || response.statusCode == 201) {
      GetCommunitiesModel result = jsonDecode(response.body);
      print(result);
      return getCommunitiesModelFromJson(result);
    } else {
      print("yaha hujn");
      print(response.reasonPhrase);
      throw Exception(response.reasonPhrase);
    }
  }

  Future<CreateCommunityModel> createCommunities(
      String name, String description, String picture, bool isPublic) async {
    var token = await HelperClass.getUserAccessToken();
    print(name);
    print(description);
    print(picture);
    print(isPublic);
    Response response = await post(Uri.parse(CREATE_COMMUNITIES), body: {
      "name": name,
      "description": description,
      "image": picture,
      "isPublic": isPublic
    }, headers: {
      //    'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200 || response.statusCode == 201) {
      GetCommunitiesModel result = jsonDecode(response.body);
      return createCommunityModelFromJson(result);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
