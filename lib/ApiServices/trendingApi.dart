import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';

import '../Exception/customExceptions.dart';
import '../Helper/helper.dart';

class TrendingApi{

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