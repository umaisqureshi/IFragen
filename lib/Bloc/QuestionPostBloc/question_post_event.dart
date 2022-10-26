part of 'question_post_bloc.dart';

abstract class QuestionPostEvent extends Equatable {
  const QuestionPostEvent();
}

class QuestionPost extends QuestionPostEvent {
  final String category;
  final String question;
  const QuestionPost(this.category, this.question);
  @override
  List<Object?> get props => [category, question];
}
