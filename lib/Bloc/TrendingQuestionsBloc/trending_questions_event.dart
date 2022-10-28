part of 'trending_questions_bloc.dart';

abstract class TrendingQuestionsEvent extends Equatable {
  const TrendingQuestionsEvent();
}

class TrendingQuestionLoadingEvent extends TrendingQuestionsEvent {
  @override
  List<Object> get props => [];
}
