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
  final Duration _duration = const Duration(milliseconds: 1000);
  late AnimationController controller;
  late Animation<double> scaleAnimation;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  int page = 0;
  bool isCollapse = true;
  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: _duration);
    scaleAnimation = Tween<double>(begin: 1, end: 0.6).animate(controller);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  final pagesOptions = const [
    Home(),
    AddQuestion(),
    MyProfile(),
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
          return Stack(children: [
            const DrawerMenu(),
            AnimatedPositioned(
                top: 0,
                bottom: 0,
                right: isCollapse ? 0 : -0.4 * size.width,
                left: isCollapse ? 0 : 0.3 * size.width,
                duration: _duration,
                child: ScaleTransition(
                    scale: scaleAnimation, child: screensHome(context))),
          ]);
        }),
      ),
    );
  }

  Widget screensHome(context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          leading: Padding(
            padding: EdgeInsets.only(left: 12),
            child: InkWell(
              onTap: () {
                setState(() {
                  if (isCollapse) {
                    controller.forward();
                  } else {
                    controller.reverse();
                  }
                  isCollapse = !isCollapse;
                });
              },
              child: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
            ),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.notifications,
                color: Colors.white,
              ),
            )
          ],
        ),
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
          backgroundColor: Colors.white,
          items: const [
            Icon(
              Icons.home,
              size: 30,
              color: Colors.white,
            ),
            Icon(
              Icons.add,
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
