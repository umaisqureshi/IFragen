import 'dart:async';
import 'package:ifragen/ApiServices/trendingApi.dart';
import '../DependencyProvider/dependencyProvider.dart';

class TrendingQuestionRepo {
  final _trendingApi = getIt.get<TrendingApi>();
  Future trendingQuestion() async {
    return  _trendingApi.trendingQuestion();
  }
}
