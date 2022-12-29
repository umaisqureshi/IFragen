import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import '../Exception/customExceptions.dart';
import '../Helper/helper.dart';
import '../Repo/trendingQuestionsRepo.dart';

class TrendingRepoImp extends TrendingQuestionRepo{
  @override
  Future trendingQuestion() async {
    var token = await HelperClass.getUserAccessToken();
    try {
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
    } on TimeoutException {
      throw BadRequestException('Request Timeout');
    } on SocketException {
      throw BadRequestException('Network Error');
    }
  }
}
