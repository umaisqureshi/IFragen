import 'dart:convert';

import 'package:http/http.dart';
import 'package:ifragen/Constant/constant.dart';
import 'package:ifragen/Helper/helper.dart';
import 'package:ifragen/Models/getAccesstokenModel.dart';
import 'package:ifragen/Models/userLoginModel.dart';
import 'package:ifragen/Models/userRegisterModel.dart';

class UserRepo {
  Future<GetAccessTokenModel> getAccessTokenfromRefreshToken() async {
    var email = await HelperClass.getUserEmail();
    var token = await HelperClass.getUserAccessToken();
    Response response = await post(Uri.parse(GET_ACCESS_TOKEN),
        body: {'email': email, 'token': token});
    if (response.statusCode == 200 || response.statusCode == 201) {
      final result = jsonDecode(response.body);

      return getAccessTokenModelFromJson(result);
    } else {
      
      throw Exception(response.reasonPhrase);
    }
  }

  Future<UserLoginModel> getUser(String email, String password) async {
    Response response = await post(Uri.parse(LOGIN_USER_API),
        body: {'email': email, 'password': password});
    if (response.statusCode == 200 || response.statusCode == 201) {
      final result = jsonDecode(response.body);
      print(response.body);
      return userLoginModelFromJson(result);
    } else {
      print(response.reasonPhrase);
      throw Exception(response.reasonPhrase);
    }
  }

  Future<UserModel> registerUser(
      String email, String password, String name) async {
    print(email + password + name);
    Response response = await post(Uri.parse(REGISTER_USER_API),
        body: {'email': email, 'password': password, 'name': name});
    if (response.statusCode == 200 || response.statusCode == 201) {
      final result = jsonDecode(response.body);
      print(response.body);
      return userModelFromJson(result);
    } else {
      print(response.reasonPhrase);
      throw Exception(response.reasonPhrase);
    }
  }
}
