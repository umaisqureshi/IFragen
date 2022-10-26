part of 'user_bloc_bloc.dart';

@immutable
abstract class UserBlocEvent extends Equatable {
  const UserBlocEvent();
}

//user check event
class UserCheckEvent extends UserBlocEvent {
  final String email;
  final String password;
  const UserCheckEvent(this.email, this.password);
  @override
  List<Object?> get props => [email, password];
}
