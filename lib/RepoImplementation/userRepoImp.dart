import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:ifragen/Repo/userRepo.dart';
import '../Constant/constant.dart';
import '../Exception/customExceptions.dart';
import '../Helper/helper.dart';
import '../Models/getAccesstokenModel.dart';
import '../Models/userLoginModel.dart';
import '../Models/userRegisterModel.dart';

class UserRepoImp extends UserRepo {
  @override
  Future<UserLoginModel> getUser(String email, String password) async {
    try {
      Response response = await post(Uri.parse(LOGIN_USER_API),
          body: {'email': email, 'password': password});
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = jsonDecode(response.body);
        return userLoginModelFromJson(result);
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
  Future<UserModel> registerUser(
      String email, String password, String name) async {
    try {
      Response response = await post(Uri.parse(REGISTER_USER_API),
          body: {'email': email, 'password': password, 'name': name});
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = jsonDecode(response.body);
        return userModelFromJson(result);
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
  Future<GetAccessTokenModel> getAccessTokenFromRefreshToken() async {
    var email = await HelperClass.getUserEmail();
    var refreshToken = await HelperClass.getUserRefreshToken();
    try {
      Response response = await post(Uri.parse(GET_ACCESS_TOKEN),
          body: {'email': email, 'token': refreshToken});
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = jsonDecode(response.body);
        return getAccessTokenModelFromJson(result);
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
