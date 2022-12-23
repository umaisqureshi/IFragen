import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ifragen/DependencyProvider/dependencyProvider.dart';
import 'package:ifragen/Screens/Home/mainHome.dart';
import 'Screens/Splash/splashScreen.dart';
import 'Helper/helper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  dependencyLocator();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isSignedIn = false;

  @override
  void initState() {
    super.initState();
    getUserLoggedInStatus();
  }

  getUserLoggedInStatus() async {
    await HelperClass.getUserLoggedInStatus().then((value) {
      if (value != null) {
        setState(() {
          _isSignedIn = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      title: 'IFragen',
      theme: ThemeData(
          useMaterial3: true,
          primaryColor: const Color(0xff003811),
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.white,
              centerTitle: true,
              elevation: 0,
              titleTextStyle: GoogleFonts.roboto(
                  color: Theme.of(context).primaryColor, fontSize: 25)),
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Colors.white)),
      home: _isSignedIn ? const MainHome() : const SplashScreen(),
    );
    //  home: const CreateCommunity());
  }
}
