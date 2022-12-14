import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ifragen/DependencyProvider/dependencyProvider.dart';
import 'package:ifragen/Repo/trendingQuestionsRepo.dart';

part 'trending_questions_event.dart';
part 'trending_questions_state.dart';

class TrendingQuestionsBloc
    extends Bloc<TrendingQuestionsEvent, TrendingQuestionsState> {
  final trendingQuestionRepo = getIt.get<TrendingQuestionRepo>();
  TrendingQuestionsBloc()
      : super(TrendingQuestionsLoading()) {
    on<TrendingQuestionsEvent>((event, emit) async {
      if (event is TrendingQuestionLoadingEvent) {
        emit(TrendingQuestionsLoading());
        try {
          var trendingQuestion = await trendingQuestionRepo.trendingQuestion();
          emit(TrendingQuestionsLoaded());
        } catch (e) {
          emit(TrendingErrorState(e.toString()));
        }
      }
    });
  }
}
