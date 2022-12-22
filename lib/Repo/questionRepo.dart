import 'dart:async';
import 'package:ifragen/ApiServices/questionApi.dart';
import '../DependencyProvider/dependencyProvider.dart';

class QuestionRepo {
  final _questionApi = getIt.get<QuestionApi>();
  Future postQuestion(String category, String question) async {
    return await _questionApi.postQuestion(category, question);
  }
}
