part of 'user_bloc_bloc.dart';

@immutable
abstract class UserBlocEvent extends Equatable {
  const UserBlocEvent();
}

//user check event
class UserCheckEvent extends UserBlocEvent {
  @override
  List<Object?> get props => [];
}
