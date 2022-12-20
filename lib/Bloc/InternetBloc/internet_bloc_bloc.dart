import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';

part 'internet_bloc_event.dart';
part 'internet_bloc_state.dart';

class InternetBloc extends Bloc<InternetBlocEvent, InternetBlocState> {
  InternetBloc() : super(InternetInitial()) {
   
    on<ConnectedEvent>((event, emit) {
      emit(const InternetConnected("Internet Connected"));
    });

    on<NotConnectedEvent>((event, emit) {
      emit(const InternetNotConnected("Internet Not Connected"));
    });
 StreamSubscription subscription;
    subscription = 
    Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile) {
        add(ConnectedEvent());
      } else {
        add(NotConnectedEvent());
      }
    });
  }
}
