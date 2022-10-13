import 'dart:convert';

import 'package:http/http.dart';
import 'package:ifragen/Constant/constant.dart';
import 'package:ifragen/Models/userModel.dart';

class UserRepo {
  getUser(String email, String password) async {
    Response response = await post(Uri.parse(END_POINT),
        body: {'email': email, 'password': password});
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<UserModel> registerUser(
      String email, String password, String name) async {
    Response response = await post(Uri.parse(REGISTER_USER_API),
        body: {'email': email, 'password': password, 'name': name});
    if (response.statusCode == 200 || response.statusCode == 201) {
      final result = jsonDecode(response.body);
      print(response.body);
      return userModelFromJson(result);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
