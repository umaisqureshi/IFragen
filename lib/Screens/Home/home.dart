import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Helper/helper.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: GestureDetector(
          onTap: () async {
            await HelperClass.saveUserLoggedInStatus(false);
          },
          child: Text(
            "Home",
            style: GoogleFonts.nunito(
                //   color: Theme.of(context).primaryColor,
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
