import 'dart:convert';

import 'package:http/http.dart';
import 'package:ifragen/Constant/constant.dart';

class QuestionRepo {
  Future postQuestion(String category, String question) async {
    Response response = await post(Uri.parse(LOGIN_USER_API),
        body: {'category': category, 'question': question});
    if (response.statusCode == 200 || response.statusCode == 201) {
      final result = jsonDecode(response.body);

      return result;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
