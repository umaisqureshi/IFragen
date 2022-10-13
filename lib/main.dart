import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ifragen/Repo/UserRepo/userRepo.dart';
import 'package:ifragen/Screens/Auth/loginScreen.dart';
import 'package:ifragen/Screens/Splash/splashScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MultiRepositoryProvider(providers: [
    RepositoryProvider<UserRepo>(create: (context) => UserRepo()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      title: 'IFragen',
      theme: ThemeData(
          useMaterial3: true,
          primaryColor: const Color(0xff212C51),
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.white,
              centerTitle: true,
              elevation: 0,
              titleTextStyle: GoogleFonts.nunito(
                  color: Theme.of(context).primaryColor, fontSize: 25))),
      home: const SplashScreen(),
    );
  }
}
