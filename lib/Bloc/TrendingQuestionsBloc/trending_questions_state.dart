part of 'trending_questions_bloc.dart';

abstract class TrendingQuestionsState extends Equatable {
  const TrendingQuestionsState();
}

class TrendingQuestionsLoading extends TrendingQuestionsState {
  @override
  List<Object> get props => [];
}

class TrendingQuestionsLoaded extends TrendingQuestionsState {
  @override
  List<Object> get props => [];
}

class TrendingErrorState extends TrendingQuestionsState {
  final String error;
  const TrendingErrorState(this.error);
  @override
  List<Object> get props => [error];
}
