import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ifragen/DependencyProvider/dependencyProvider.dart';
import 'package:ifragen/Repo/questionRepo.dart';

part 'question_post_event.dart';
part 'question_post_state.dart';

class QuestionPostBloc extends Bloc<QuestionPostEvent, QuestionPostState> {
  final questionRepo = getIt.get<QuestionRepo>();
  QuestionPostBloc() : super(QuestionPostInitial()) {
    on<QuestionPostEvent>((event, emit) async {

      if (event is QuestionPost) {
        
        if (event.category.isEmpty || event.question.isEmpty) {
          emit(const QuestionErrorState("Question is empty"));
        } else {
          emit(QuestionPostInitial());

          try {
            var question =
                await questionRepo.postQuestion(event.category, event.question);

            emit(QuestionPosted());
          } catch (e) {
            emit(QuestionErrorState(e.toString()));
          }
        }
      }
    });
  }
}
