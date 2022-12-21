import 'dart:async';
import 'package:ifragen/ApiServices/userApi.dart';
import 'package:ifragen/Models/getAccesstokenModel.dart';
import 'package:ifragen/Models/userLoginModel.dart';
import 'package:ifragen/Models/userRegisterModel.dart';

import '../Helper/helper.dart';

class UserRepo {
  UserApi userApi = UserApi();
  Future<UserLoginModel> getUser(String email, String password) async {
    return userApi.loginUser(email, password);
  }

  Future<UserModel> registerUser(
      String email, String password, String name) async {
    return userApi.registerUser(email, password, name);
  }

  Future<GetAccessTokenModel> getAccessTokenFromRefreshToken() async {
    var email = await HelperClass.getUserEmail();
    var token = await HelperClass.getUserRefreshToken();
    return userApi.getAccessTokenFromRefreshToken(email!, token!);
  }
}
