import 'dart:async';
import 'package:ifragen/ApiServices/questionApi.dart';

class QuestionRepo {
 final QuestionApi _questionApi = QuestionApi();
  Future postQuestion(String category, String question) async {
    return _questionApi.postQuestion(category, question);
  }
}
