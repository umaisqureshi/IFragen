import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ifragen/Screens/Drawer/drawer.dart';
import 'package:ifragen/Screens/Home/home.dart';
import '../../Bloc/InternetBloc/internet_bloc_bloc.dart';
import '../../Widgets/widgets.dart';
import '../AddQuestion/addQuestion.dart';
import '../Profile/myprofile.dart';

class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome>
    with SingleTickerProviderStateMixin {
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  int page = 0;

  final pagesOptions = const [
    Home(),
    MyProfile(),
  ];
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
          return screensHome(context);
        }),
      ),
    );
  }

  Widget screensHome(context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          color: Theme.of(context).primaryColor,
          height: 60,
          buttonBackgroundColor: Theme.of(context).primaryColor,
          animationDuration: const Duration(milliseconds: 600),
          index: 0,
          onTap: (index) {
            setState(() {
              page = index;
            });
          },
          letIndexChange: (index) => true,
          key: _bottomNavigationKey,
          backgroundColor: Colors.white10,
          items: const [
            Icon(
              Icons.home,
              size: 30,
              color: Colors.white,
            ),
            Icon(
              Icons.person,
              size: 30,
              color: Colors.white,
            ),
          ],
        ),
        body: pagesOptions[page],
      ),
    );
  }
}
