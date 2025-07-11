import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get themeData => ThemeData(
    appBarTheme: _appBarTheme,
    scaffoldBackgroundColor: const Color(0xffF1F5F7),
  );
}

final _appBarTheme = AppBarTheme(
  backgroundColor: Colors.white,
  elevation: 0,
  titleTextStyle: TextStyle(
    fontFamily: GoogleFonts.lato().fontFamily,
    color: Colors.black,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  ),
  centerTitle: false,
  iconTheme: const IconThemeData(color: Colors.black),
);
