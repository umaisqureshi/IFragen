import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ifragen/Repo/UserRepo/userRepo.dart';
import 'package:meta/meta.dart';

part 'user_bloc_event.dart';
part 'user_bloc_state.dart';

class UserLoginBloc extends Bloc<UserBlocEvent, UserBlocState> {
  UserRepo userRepo;
  String email;
  String password;
  UserLoginBloc(this.userRepo, this.email, this.password)
      : super(UserLoadingState()) {
    on<UserCheckEvent>((event, emit) async {
      emit(UserLoadingState());
      try {
        final user = await userRepo.getUser(email, password);
        emit(UserLoadedState());
      } catch (e) {
        emit(UserErrorState());
      }
    });
  }
}
