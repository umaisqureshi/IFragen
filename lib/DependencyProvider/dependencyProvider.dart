import 'package:get_it/get_it.dart';
import 'package:ifragen/ApiServices/communityApi.dart';
import 'package:ifragen/ApiServices/questionApi.dart';
import 'package:ifragen/ApiServices/trendingApi.dart';
import 'package:ifragen/ApiServices/userApi.dart';
import 'package:ifragen/Repo/allCommunityRepo.dart';
import 'package:ifragen/Repo/questionRepo.dart';
import 'package:ifragen/Repo/trendingQuestionsRepo.dart';
import 'package:ifragen/Repo/userRepo.dart';

final getIt = GetIt.instance;

void dependencyLocator() {
  getIt.registerLazySingleton<UserRepo>(() => UserApi());
  getIt.registerLazySingleton<CommunityRepo>(() => CommunityApi());
  getIt.registerLazySingleton<QuestionRepo>(() => QuestionApi());
  getIt.registerLazySingleton<TrendingQuestionRepo>(() => TrendingApi());
}
