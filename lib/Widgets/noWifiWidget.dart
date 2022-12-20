// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoWifiWidget extends StatelessWidget {
  final String msg;
  final Color color;
  const NoWifiWidget({
    Key? key,
    required this.msg,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Container(
            height: 200,
            width: 200,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "assets/wifi.png",
                    ),
                    fit: BoxFit.cover),
                // color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(40))),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          msg,
          style: GoogleFonts.roboto(
              color: color, fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
