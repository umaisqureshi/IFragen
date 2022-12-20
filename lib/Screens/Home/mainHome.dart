import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ifragen/Screens/Home/home.dart';
import '../../Bloc/InternetBloc/internet_bloc_bloc.dart';
import '../../Widgets/noWifiWidget.dart';

class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => InternetBloc(),
        ),
      ],
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocBuilder<InternetBloc, InternetBlocState>(
            builder: (context, state) {
          if (state is InternetNotConnected) {
            return NoWifiWidget(
              msg: state.msg,
              color: Theme.of(context).primaryColor,
            );
          }
          return const Home();
        }),
      ),
    );
  }
}
