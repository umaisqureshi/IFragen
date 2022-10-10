import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ifragen/Screens/Auth/loginScreen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/splashimage2.jpg"),
                opacity: 1.0,
                fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
              ),
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: AssetImage(
                          "assets/splashicon.png",
                        ),
                        fit: BoxFit.cover),
                    color: Theme.of(context).primaryColor,
                    borderRadius: const BorderRadius.all(Radius.circular(40))),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "What are you looking for?\nTrust yourself that you can do it and find it.",
                style: GoogleFonts.nunito(
                    //   color: Theme.of(context).primaryColor,
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Connect with your interset-related community and get your all answers and create your own community to facilitate the others.",
                style: GoogleFonts.nunito(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
                  },
                  child: Container(
                    height: 70,
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(40))),
                    child: Center(
                      child: Text(
                        "Get Started",
                        style: GoogleFonts.nunito(
                            color: Theme.of(context).primaryColor,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
