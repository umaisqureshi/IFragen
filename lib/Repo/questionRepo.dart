import 'dart:async';
import 'package:ifragen/ApiServices/questionApi.dart';

class QuestionRepo {
  QuestionApi questionApi = QuestionApi();
  Future postQuestion(String category, String question) async {
    return questionApi.postQuestion(category, question);
  }
}
