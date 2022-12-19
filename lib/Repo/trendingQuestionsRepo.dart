import 'dart:convert';
import 'package:http/http.dart';
import 'package:ifragen/Helper/helper.dart';

class TrendingQuestionRepo {
  Future trendingQuestion() async {
    var token = await HelperClass.getUserAccessToken();
    Response response = await get(Uri.parse(""), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200 || response.statusCode == 201) {
      final result = jsonDecode(response.body);

      return result;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
