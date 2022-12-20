import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget iconsAndTextButton(
  int count,
  Icon icon,
  BuildContext context,
) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      IconButton(
        onPressed: null,
        icon: icon,
        color: Theme.of(context).colorScheme.secondary,
      ),
      Text(
        count.toString(),
        style: GoogleFonts.roboto(
            color: Theme.of(context).primaryColor,
            fontSize: 12,
            fontWeight: FontWeight.bold),
      ),
    ],
  );
}
