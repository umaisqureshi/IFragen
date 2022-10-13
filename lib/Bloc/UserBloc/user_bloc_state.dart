part of 'user_bloc_bloc.dart';

@immutable
abstract class UserBlocState extends Equatable{}


// user loading state
class UserLoadingState extends UserBlocState {
  @override
  List<Object?> get props => [];
}
 //user loaded state
class UserLoadedState extends UserBlocState {
  @override
  List<Object?> get props => [];
}

 //no user found state 
 class UserErrorState extends UserBlocState {
  @override
  List<Object?> get props => [];
}