import 'dart:async';
import 'package:ifragen/Models/getAccesstokenModel.dart';
import 'package:ifragen/Models/userLoginModel.dart';
import 'package:ifragen/Models/userRegisterModel.dart';

abstract class UserRepo {
  Future<UserLoginModel> getUser(String email, String password);
  Future<UserModel> registerUser(String email, String password, String name);
  Future<GetAccessTokenModel> getAccessTokenFromRefreshToken();
}
