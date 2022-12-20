import 'dart:async';

import 'package:ifragen/ApiServices/trendingApi.dart';

class TrendingQuestionRepo {
  TrendingApi trendingApi = TrendingApi();
  Future trendingQuestion() async {
    return trendingApi.trendingQuestion();
  }
}
