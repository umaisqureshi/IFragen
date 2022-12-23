import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:ifragen/Constant/constant.dart';
import 'package:ifragen/Repo/allCommunityRepo.dart';
import '../Exception/customExceptions.dart';
import '../Helper/helper.dart';
import '../Models/createCommunityModel.dart';
import '../Models/getCommunitiesModel.dart';

class CommunityApi extends CommunityRepo {
  
  @override
  Future<CreateCommunityModel> createCommunities(
      String name, String description, String picture, bool isPublic) async {
    var token = await HelperClass.getUserAccessToken();
    var headers = {'Authorization': 'Bearer $token'};
    var request = MultipartRequest('POST', Uri.parse(CREATE_COMMUNITIES));
    try {
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
    } on TimeoutException {
      throw BadRequestException('Request Timeout');
    } on SocketException {
      throw BadRequestException('Network Error');
    }
  }

  @override
  Future<GetCommunitiesModel> allCommunities() async {
    var token = await HelperClass.getUserAccessToken();
    try {
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
    } on TimeoutException {
      throw BadRequestException('Request Timeout');
    } on SocketException {
      throw BadRequestException('Network Error');
    }
  }
}
