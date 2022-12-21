import 'dart:async';

import 'package:ifragen/ApiServices/trendingApi.dart';


class TrendingQuestionRepo {
  final TrendingApi _trendingApi = TrendingApi();
  Future trendingQuestion() async {
  
    return _trendingApi.trendingQuestion();
  }
}
