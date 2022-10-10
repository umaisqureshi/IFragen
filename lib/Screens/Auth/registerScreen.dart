import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ifragen/Screens/Auth/loginScreen.dart';
import '../../Utilis/inputdecoration.dart';

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

  bool isValidEmail(String email) {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(email);
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
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
                  height: MediaQuery.of(context).size.height * 0.75,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: loading
                      ? Center(
                          child: CircularProgressIndicator(
                            color: Theme.of(context).primaryColor,
                          ),
                        )
                      : Form(
                          key: _registerFormKey,
                          child: Column(
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                              ),
                              Center(
                                child: Text(
                                  "Welcome!",
                                  style: GoogleFonts.nunito(
                                      color: Theme.of(context).primaryColor,
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
                                  style: GoogleFonts.nunito(
                                      // color: Theme.of(context).primaryColor,
                                      color: Colors.black45,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: TextFormField(
                                  onChanged: (value) {
                                    fullName = value;
                                    setState(() {});
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "This is mandatory";
                                    }
                                    return null;
                                  },
                                  style: GoogleFonts.nunito(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                  decoration: inputDecorationTextField.copyWith(
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
                                    if (value == null || value.isEmpty) {
                                      return "This is mandatory";
                                    } else if (!isValidEmail(value)) {
                                      return "Invalid email";
                                    }
                                    return null;
                                  },
                                  style: GoogleFonts.nunito(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                  decoration: inputDecorationTextField.copyWith(
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
                                    if (value == null || value.isEmpty) {
                                      return "This is mandatory";
                                    }
                                    return null;
                                  },
                                  style: GoogleFonts.nunito(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                  decoration: inputDecorationTextField.copyWith(
                                      prefixIcon: const Icon(
                                        Icons.password,
                                        color: Colors.white,
                                      ),
                                      hintText: "Password"),
                                  obscureText: true,
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                              ),
                              GestureDetector(
                                onTap: (() async {
                                  if (_registerFormKey.currentState!
                                      .validate()) {
                                    // setState(() {
                                    //   loading = true;
                                    // });
                                  }

                                  // ignore: use_build_context_synchronously
                                }),
                                child: Container(
                                  height: 60,
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  decoration: const BoxDecoration(
                                      color: Colors.black87,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(30),
                                      )),
                                  child: Center(
                                    child: Text(
                                      "Sign Up",
                                      style: GoogleFonts.nunito(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
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
                                  style: GoogleFonts.nunito(
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
                                  style: GoogleFonts.nunito(
                                      color: Theme.of(context).primaryColor,
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
      ),
    );
  }
}
