part of 'question_post_bloc.dart';

abstract class QuestionPostState extends Equatable {
  const QuestionPostState();

}

class QuestionPostInitial extends QuestionPostState {
  @override
  List<Object?> get props => [];
}
class QuestionPosted extends QuestionPostState{
  @override
  List<Object?> get props => [];
}

class QuestionErrorState extends QuestionPostState {
  final String error;
 const QuestionErrorState(this.error);
   @override
  List<Object?> get props => [error];
}