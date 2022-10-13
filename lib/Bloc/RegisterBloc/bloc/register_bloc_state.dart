part of 'register_bloc_bloc.dart';

abstract class RegisterBlocState extends Equatable {
  const RegisterBlocState();
}

// user loading state
class UserCreatingState extends RegisterBlocState {
  @override
  List<Object?> get props => [];
}

//user registered state
class UserCreatedState extends RegisterBlocState {
  final UserModel user;
  const UserCreatedState(this.user);
  @override
  List<Object?> get props => [user];
}

//error state
class RegisterErrorState extends RegisterBlocState {
  final String error;
  const RegisterErrorState(this.error);
  @override
  List<Object?> get props => [error];
}
