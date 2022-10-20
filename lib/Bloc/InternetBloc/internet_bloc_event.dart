part of 'internet_bloc_bloc.dart';

abstract class InternetBlocEvent extends Equatable {
  const InternetBlocEvent();

  @override
  List<Object> get props => [];
}

// when connected
class ConnectedEvent extends InternetBlocEvent{}

//when no internet
class NotConnectedEvent extends InternetBlocEvent{}