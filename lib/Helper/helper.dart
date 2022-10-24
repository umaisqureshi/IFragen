import 'package:collection/collection.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HelperClass {
  static String userLoggedInKey = "LOGGEDINKEY";
  static String userNameKey = "USERNAMEKEY";
  static String userEmailKey = "USEREMAILKEY";
  static String userAcessToken = "USERACCESSTOKEN";
  static String userRefreshToken = "USERREFRESHTOKEN";

  // saving the data to SF

  static Future<bool> saveUserLoggedInStatus(bool isUserLoggedIn) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setBool(userLoggedInKey, isUserLoggedIn);
  }

  static Future<bool> saveUserNameSF(String userName) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(userNameKey, userName);
  }

  static Future<bool> saveUserAccessToken(String token) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(userAcessToken, token);
  }

  static Future<bool> saveUserRefreshToken(String token) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(userRefreshToken, token);
  }

  static Future<bool> saveUserEmailSF(String userEmail) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(userEmailKey, userEmail);
  }

  // getting the data from SF

  static Future<bool?> getUserLoggedInStatus() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getBool(userLoggedInKey);
  }

  static Future<String?> getUserEmail() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(userEmailKey);
  }

  static Future<String?> getUserAccessToken() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(userAcessToken);
  }

  static Future<String?> getUserRefreshToken() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(userRefreshToken);
  }

  static Future<String?> getUserNameFromSF() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(userNameKey);
  }


}
