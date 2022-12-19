import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ifragen/Helper/helper.dart';
import 'package:ifragen/Models/userRegisterModel.dart';

import '../../../Repo/userRepo.dart';

part 'register_bloc_event.dart';
part 'register_bloc_state.dart';

class RegisterBloc extends Bloc<RegisterBlocEvent, RegisterBlocState> {
  UserRepo userRepo;

  RegisterBloc(this.userRepo) : super(UserCreatingState()) {
    on<RegisterBlocEvent>((event, emit) async {
      if (event is UserCreateEvent) {
        if (event.email.isEmpty || event.password.isEmpty) {
          emit(const RegisterErrorState("Email and password are empty"));
        } else {
          emit(UserCreatingState());

          try {
            final UserModel user = await userRepo.registerUser(
                event.email, event.password, event.name);
            await HelperClass.saveUserEmailSF(user.user.email);
            await HelperClass.saveUserNameSF(user.user.name);
            await HelperClass.saveUserLoggedInStatus(true);
            emit(UserCreatedState(user));
          } catch (e) {
            emit(RegisterErrorState(e.toString()));
          }
        }
      }
    });
  }
}
