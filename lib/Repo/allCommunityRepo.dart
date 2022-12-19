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
      final result = jsonDecode(response.body);
      return getCommunitiesModelFromJson(result);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<CreateCommunityModel> createCommunities(
      String name, String description, String picture, bool isPublic) async {
    var token = await HelperClass.getUserAccessToken();
    var headers = {'Authorization': 'Bearer $token'};
    var request = MultipartRequest('POST', Uri.parse(CREATE_COMMUNITIES));
    request.fields.addAll({
      'name': name,
      'description': description,
      'isPublic': isPublic.toString(),
    });
    request.files.add(await MultipartFile.fromPath('image', picture));
    request.headers.addAll(headers);

    StreamedResponse response = await request.send();

    if (response.statusCode == 200 || response.statusCode == 201) {
      final result = jsonDecode(await response.stream.bytesToString());
      return createCommunityModelFromJson(result);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
