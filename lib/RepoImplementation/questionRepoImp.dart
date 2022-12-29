import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:ifragen/Repo/questionRepo.dart';
import '../Exception/customExceptions.dart';

class QuestionRepoImp extends QuestionRepo {
  @override
  Future postQuestion(String category, String question) async {
    try {
      Response response = await post(Uri.parse(""),
          body: {'category': category, 'question': question});
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = jsonDecode(response.body);

        return result;
      } else {
        throw Exception(response.reasonPhrase);
      }
    } on TimeoutException {
      throw BadRequestException('Request Timeout');
    } on SocketException {
      throw BadRequestException('Network Error');
    }
  }
}
