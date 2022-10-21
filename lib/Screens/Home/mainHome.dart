import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ifragen/Screens/Drawer/drawer.dart';

import '../../Helper/helper.dart';

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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: [
        const DrawerMenu(),
        AnimatedPositioned(
            top: 0,
            bottom: 0,
            right: isCollapse ? 0 : -0.4 * size.width,
            left: isCollapse ? 0 : 0.3 * size.width,
            duration: _duration,
            child:
                ScaleTransition(scale: scaleAnimation, child: home(context))),
      ]),
    );
  }

  Widget home(context) {
    return SafeArea(
      child: Scaffold(
        body: Material(
          elevation: 8,
          animationDuration: _duration,
          color: Theme.of(context).primaryColor,
          child: Container(
            height: double.infinity,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
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
                    Text(
                      "Home",
                      style: GoogleFonts.nunito(
                          //   color: Theme.of(context).primaryColor,
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.settings,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
