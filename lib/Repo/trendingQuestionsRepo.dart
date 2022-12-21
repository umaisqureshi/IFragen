import 'dart:async';

import 'package:ifragen/ApiServices/trendingApi.dart';

import '../Helper/helper.dart';

class TrendingQuestionRepo {
  TrendingApi trendingApi = TrendingApi();
  Future trendingQuestion() async {
    var token = await HelperClass.getUserAccessToken();
    return trendingApi.trendingQuestion(token!);
  }
}
