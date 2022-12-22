import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Bloc/UserBloc/user_bloc_bloc.dart';

Container errorStateWidget(BuildContext context, UserErrorState state) {
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
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            state.error,
            // "InCorrect Email and Password",
            style: GoogleFonts.roboto(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 50,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
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
                  "Back",
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

