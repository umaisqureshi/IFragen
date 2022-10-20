part of 'internet_bloc_bloc.dart';

abstract class InternetBlocState extends Equatable {
  const InternetBlocState();

  @override
  List<Object> get props => [];
}

class InternetInitial extends InternetBlocState {}

class InternetConnected extends InternetBlocState {
  final String msg;
  const InternetConnected(this.msg);
}

class InternetNotConnected extends InternetBlocState {
  final String msg;
  const InternetNotConnected(this.msg);
}
