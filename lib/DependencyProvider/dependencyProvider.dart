import 'package:get_it/get_it.dart';
import 'package:ifragen/ApiServices/communityApi.dart';
import 'package:ifragen/ApiServices/questionApi.dart';
import 'package:ifragen/ApiServices/trendingApi.dart';
import 'package:ifragen/ApiServices/userApi.dart';

final getIt = GetIt.instance;

void dependencyLocator() {
  getIt.registerLazySingleton<UserApi>(() => UserApi());
  getIt.registerLazySingleton<CommunityApi>(() => CommunityApi());
  getIt.registerLazySingleton<QuestionApi>(() => QuestionApi());
  getIt.registerLazySingleton<TrendingApi>(() => TrendingApi());
}
