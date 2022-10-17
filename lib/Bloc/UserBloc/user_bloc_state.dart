part of 'user_bloc_bloc.dart';

@immutable
abstract class UserBlocState extends Equatable {}

// user loading state
class UserLoadingState extends UserBlocState {
  @override
  List<Object?> get props => [];
}

//user loaded state
class UserLoadedState extends UserBlocState {
  final UserLoginModel user;
  UserLoadedState(this.user);
  @override
  List<Object?> get props => [user];
}

//no user found state
class UserErrorState extends UserBlocState {
  final String error;
  UserErrorState(this.error);
  @override
  List<Object?> get props => [error];
}
