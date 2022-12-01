import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ifragen/Repo/allCommunityRepo.dart';
import 'package:ifragen/Repo/questionRepo.dart';
import 'package:ifragen/Repo/userRepo.dart';
import 'package:ifragen/Screens/Home/mainHome.dart';
import 'Helper/helper.dart';
import 'Repo/trendingQuestionsRepo.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MultiRepositoryProvider(providers: [
    RepositoryProvider<UserRepo>(create: (context) => UserRepo()),
    RepositoryProvider<QuestionRepo>(create: (context) => QuestionRepo()),
    RepositoryProvider<TrendingQuestionRepo>(
        create: (context) => TrendingQuestionRepo()),
    RepositoryProvider<CommunityRepo>(create: (context) => CommunityRepo()),
  ], child: const MyApp()));
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
          accentColor: Colors.white,
          primaryColor: const Color(0xff003811),
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.white,
              centerTitle: true,
              elevation: 0,
              titleTextStyle: GoogleFonts.roboto(
                  color: Theme.of(context).primaryColor, fontSize: 25))),
      // home: _isSignedIn ? const MainHome() : const SplashScreen(),
      home: const MainHome(),
    );
    //  home: const CreateCommunity());
  }
}
