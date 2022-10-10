import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

InputDecoration inputDecorationTextField = InputDecoration(
  focusColor: const Color(0xff49C2E1),
  border: OutlineInputBorder(
    borderSide: const BorderSide(color: Color(0xff212C51), width: 1.0),
    borderRadius: BorderRadius.circular(15.0),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Color(0xff212C51), width: 5.0),
    borderRadius: BorderRadius.circular(15.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Color(0xff212C51), width: 1.0),
    borderRadius: BorderRadius.circular(15.0),
  ),
  fillColor: const Color(0xff212C51),
  filled: true,
  hintStyle: GoogleFonts.nunito(
      color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
);
