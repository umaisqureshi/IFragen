import 'dart:async';
import 'package:ifragen/ApiServices/userApi.dart';
import 'package:ifragen/DependencyProvider/dependencyProvider.dart';
import 'package:ifragen/Models/getAccesstokenModel.dart';
import 'package:ifragen/Models/userLoginModel.dart';
import 'package:ifragen/Models/userRegisterModel.dart';

class UserRepo {
  final _userApi = getIt.get<UserApi>();

  Future<UserLoginModel> getUser(String email, String password) async {
    return await _userApi.loginUser(email, password);
  }

  Future<UserModel> registerUser(
      String email, String password, String name) async {
    return await _userApi.registerUser(email, password, name);
  }

  Future<GetAccessTokenModel> getAccessTokenFromRefreshToken() async {
    return await _userApi.getAccessTokenFromRefreshToken();
  }
}
