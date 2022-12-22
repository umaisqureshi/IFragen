import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ifragen/Bloc/InternetBloc/internet_bloc_bloc.dart';
import 'package:ifragen/Screens/Auth/registerScreen.dart';
import 'package:ifragen/Screens/Auth/widgets/widgets.dart';
import 'package:ifragen/Screens/Home/mainHome.dart';
import '../../Bloc/UserBloc/user_bloc_bloc.dart';
import '../../Repo/userRepo.dart';
import '../../Utilis/inputdecoration.dart';
import '../../Widgets/noWifiWidget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = "";
  String password = "";
  bool loading = false;

  final _loginFormKey = GlobalKey<FormState>();

  bool isValidEmail(String email) {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[fau]+\.[de]+");
    return emailRegExp.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              UserLoginBloc(RepositoryProvider.of<UserRepo>(context)),
        ),
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
              return BlocConsumer<UserLoginBloc, UserBlocState>(
                listener: (context, state) {
                  if (state is UserLoadedState) {
                    Timer(const Duration(seconds: 2), (() {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const MainHome()));
                    }));
                  }
                },
                builder: ((context, state) {
                  if (state is UserErrorState) {
                    return errorStateWidget(context, state);
                  } else if (state is UserLoadedState) {
                    return AlertDialog(
                      elevation: 9,
                      title: Text(
                        "Welcome",
                        style: GoogleFonts.roboto(
                            color: Theme.of(context).primaryColor,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      content: Text(
                        "Good to see you again",
                        style: GoogleFonts.roboto(
                            color:
                                Theme.of(context).primaryColor.withOpacity(0.8),
                            fontSize: 20,
                            fontWeight: FontWeight.normal),
                      ),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                    );
                  } else {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.15,
                          ),
                          Opacity(
                            opacity: 0.9,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.7,
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
                                child: loading
                                    ? Center(
                                        child: CircularProgressIndicator(
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      )
                                    : Form(
                                        key: _loginFormKey,
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.07,
                                            ),
                                            Center(
                                              child: Text(
                                                "Hello Again!",
                                                style: GoogleFonts.roboto(
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Center(
                                              child: Text(
                                                "Welcome Back You've\n        Been Missed!",
                                                style: GoogleFonts.roboto(
                                                    // color: Theme.of(context).primaryColor,
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.07,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child: TextFormField(
                                                onChanged: (value) {
                                                  email = value;
                                                  setState(() {});
                                                },
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return "This is mandatory";
                                                  } else if (!isValidEmail(
                                                      value)) {
                                                    return "Invalid email";
                                                  }
                                                  return null;
                                                },
                                                style: GoogleFonts.roboto(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                decoration:
                                                    inputDecorationTextField
                                                        .copyWith(
                                                  hintText: "Email",
                                                  prefixIcon: const Icon(
                                                    Icons
                                                        .person_outline_rounded,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child: TextFormField(
                                                onChanged: (value) {
                                                  password = value;
                                                  setState(() {});
                                                },
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return "This is mandatory";
                                                  }
                                                  return null;
                                                },
                                                style: GoogleFonts.roboto(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                decoration:
                                                    inputDecorationTextField
                                                        .copyWith(
                                                            prefixIcon:
                                                                const Icon(
                                                              Icons.password,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            hintText:
                                                                "Password"),
                                                obscureText: true,
                                              ),
                                            ),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.05,
                                            ),
                                            GestureDetector(
                                              onTap: (() async {
                                                if (_loginFormKey.currentState!
                                                    .validate()) {
                                                  setState(() {
                                                    loading = true;
                                                  });
                                                  BlocProvider.of<
                                                              UserLoginBloc>(
                                                          context)
                                                      .add(UserCheckEvent(
                                                          email, password));

                                                  setState(() {
                                                    loading = false;
                                                  });
                                                }

                                                // ignore: use_build_context_synchronously
                                              }),
                                              child: Container(
                                                height: 60,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.5,
                                                decoration: const BoxDecoration(
                                                    color: Colors.black,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(30),
                                                    )),
                                                child: Center(
                                                  child: Text(
                                                    "Sign In",
                                                    style: GoogleFonts.roboto(
                                                        color: Colors.white,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 30,
                                            ),
                                            RichText(
                                                text: TextSpan(children: [
                                              TextSpan(
                                                text: "Not a Member? ",
                                                style: GoogleFonts.roboto(
                                                    color: Colors.black,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              TextSpan(
                                                text: "Register Now",
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = () {
                                                        Navigator.of(context)
                                                            .pushReplacement(
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            const RegisterScreen()));
                                                      },
                                                style: GoogleFonts.roboto(
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ]))
                                          ],
                                        )),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                }),
              );
            },
          )),
    );
  }
}
