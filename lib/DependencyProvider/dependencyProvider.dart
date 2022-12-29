import 'package:get_it/get_it.dart';
import 'package:ifragen/RepoImplementation/communityRepoImp.dart';
import 'package:ifragen/RepoImplementation/questionRepoImp.dart';
import 'package:ifragen/RepoImplementation/trendingRepoImp.dart';
import 'package:ifragen/RepoImplementation/userRepoImp.dart';
import 'package:ifragen/Repo/allCommunityRepo.dart';
import 'package:ifragen/Repo/questionRepo.dart';
import 'package:ifragen/Repo/trendingQuestionsRepo.dart';
import 'package:ifragen/Repo/userRepo.dart';

final getIt = GetIt.instance;

void dependencyLocator() {
  getIt.registerLazySingleton<UserRepo>(() => UserRepoImp());
  getIt.registerLazySingleton<CommunityRepo>(() => CommunityRepoImp());
  getIt.registerLazySingleton<QuestionRepo>(() => QuestionRepoImp());
  getIt.registerLazySingleton<TrendingQuestionRepo>(() => TrendingRepoImp());
}
