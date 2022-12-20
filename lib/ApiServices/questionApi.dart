import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';

import '../Exception/customExceptions.dart';

class QuestionApi{

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
      Map<String, dynamic> loop = {'message': 'Request Timeout'};
      Map<String, dynamic> err = {
        'statusCode': "400",
        'message': loop,
      };
      String error = json.encode(err);
      throw BadRequestException(error);
    } on SocketException {
      Map<String, dynamic> loop = {'message': 'Network Error'};
      Map<String, dynamic> err = {
        'statusCode': "400",
        'message': loop,
      };
      String error = json.encode(err);
      throw BadRequestException(error);
    }
  }


  
}