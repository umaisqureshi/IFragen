import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ifragen/Repo/userRepo.dart';
import 'package:ifragen/Screens/Auth/loginScreen.dart';
import '../../Bloc/InternetBloc/internet_bloc_bloc.dart';
import '../../Bloc/RegisterBloc/register_bloc_bloc.dart';
import '../../Utilis/inputdecoration.dart';
import '../../Widgets/widgets.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String email = "";
  String password = "";
  String fullName = "";
  bool loading = false;
  final _registerFormKey = GlobalKey<FormState>();
// a-zA-Z0-9
  bool isValidEmail(String email) {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[fau]+\.[de]+");
    return emailRegExp.hasMatch(email);
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              RegisterBloc(RepositoryProvider.of<UserRepo>(context)),
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

              return BlocConsumer<RegisterBloc, RegisterBlocState>(
                  listener: (context, state) {
                if (state is UserCreatedState) {
                  Timer(const Duration(seconds: 3), (() {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
                  }));
                  AlertDialog(
                    title: Text(
                      "Congratulation",
                      style: GoogleFonts.roboto(
                          color: Theme.of(context).primaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    content: Text(
                      "Kindly verify your email and login again",
                      style: GoogleFonts.roboto(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.6),
                          fontSize: 15,
                          fontWeight: FontWeight.normal),
                    ),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  );
                }
              }, builder: ((context, state) {
                if (state is RegisterErrorState) {
                  return Container(
                    height: double.infinity,
                    width: double.infinity,
                    color: Theme.of(context).primaryColor,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "OOPS!",
                            style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Email is Already Registered",
                            style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: ((context) =>
                                          const LoginScreen())));
                            },
                            child: Container(
                              height: 60,
                              width: MediaQuery.of(context).size.width * 0.5,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30),
                                  )),
                              child: Center(
                                child: Text(
                                  "Go To Login",
                                  style: GoogleFonts.roboto(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }

                return loading
                    ? Center(
                        child: CircularProgressIndicator(
                            color: Theme.of(context).primaryColor),
                      )
                    : SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.09,
                            ),
                            Opacity(
                              opacity: 0.8,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.75,
                                  width: double.infinity,
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30))),
                                  child: Form(
                                      key: _registerFormKey,
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
                                              "Welcome!",
                                              style: GoogleFonts.roboto(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Center(
                                            child: Text(
                                              "Create an Account!",
                                              style: GoogleFonts.roboto(
                                                  // color: Theme.of(context).primaryColor,
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.07,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: TextFormField(
                                              onChanged: (value) {
                                                fullName = value;
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
                                                  fontWeight: FontWeight.bold),
                                              decoration:
                                                  inputDecorationTextField
                                                      .copyWith(
                                                hintText: "Full Name",
                                                prefixIcon: const Icon(
                                                  Icons.person,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(15.0),
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
                                                  fontWeight: FontWeight.bold),
                                              decoration:
                                                  inputDecorationTextField
                                                      .copyWith(
                                                hintText: "Email",
                                                prefixIcon: const Icon(
                                                  Icons.email,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(15.0),
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
                                                  fontWeight: FontWeight.bold),
                                              decoration:
                                                  inputDecorationTextField
                                                      .copyWith(
                                                          prefixIcon:
                                                              const Icon(
                                                            Icons.password,
                                                            color: Colors.white,
                                                          ),
                                                          hintText: "Password"),
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
                                              if (_registerFormKey.currentState!
                                                  .validate()) {
                                                setState(() {
                                                  loading = true;
                                                });
                                                BlocProvider.of<RegisterBloc>(
                                                        context)
                                                    .add(UserCreateEvent(email,
                                                        password, fullName));

                                                setState(() {
                                                  loading = false;
                                                });
                                              }
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
                                                  "Sign Up",
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
                                              text: "Already a Member? ",
                                              style: GoogleFonts.roboto(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            TextSpan(
                                              text: "Login Now",
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const LoginScreen()));
                                                },
                                              style: GoogleFonts.roboto(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
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
              }));
            },
          )),
    );
  }
}
