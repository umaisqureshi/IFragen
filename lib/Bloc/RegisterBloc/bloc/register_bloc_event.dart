part of 'register_bloc_bloc.dart';

abstract class RegisterBlocEvent extends Equatable {
  const RegisterBlocEvent();
}

//user create event
class UserCreateEvent extends RegisterBlocEvent {
 final String email;
  final String password;
  final String name;

  const UserCreateEvent(this.email, this.name, this.password);
  @override
  List<Object?> get props => [];
}
