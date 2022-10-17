import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ifragen/Models/userLoginModel.dart';
import 'package:ifragen/Repo/userRepo.dart';
import 'package:meta/meta.dart';

import '../../Helper/helper.dart';

part 'user_bloc_event.dart';
part 'user_bloc_state.dart';

class UserLoginBloc extends Bloc<UserBlocEvent, UserBlocState> {
  UserRepo userRepo;

  UserLoginBloc(this.userRepo) : super(UserLoadingState()) {
    on<UserBlocEvent>((event, emit) async {
      if (event is UserCheckEvent) {
        if (event.email.isEmpty || event.password.isEmpty) {
          emit(UserErrorState("Email and password are empty"));
        } else {
          emit(UserLoadingState());

          try {
            final UserLoginModel user =
                await userRepo.getUser(event.email, event.password);
           await HelperClass.saveUserAccessToken(user.token.accessToken);
           await HelperClass.saveUserRefreshToken(user.token.refreshToken);
           await HelperClass.saveUserLoggedInStatus(true);
            emit(UserLoadedState(user));
          } catch (e) {
            emit(UserErrorState(e.toString()));
          }
        }
      }
    });
  }
}
