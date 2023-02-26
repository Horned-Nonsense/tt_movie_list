import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class MovieTextStyle {
  static TextStyle appBarTitleTextStyle = GoogleFonts.lato(
    fontSize: 32,
    fontWeight: FontWeight.w700,
  );

  static TextStyle moviesNameTextStyle = GoogleFonts.lato(
    fontSize: 30,
    fontWeight: FontWeight.w500,
  );

  static TextStyle infoTextStyle = GoogleFonts.lato(
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );

  static TextStyle tileMoviesNameTextStyle = GoogleFonts.lato(
    fontSize: 24,
    fontWeight: FontWeight.w500,
  );

  static TextStyle tileInfoTextStyle = GoogleFonts.lato(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
}
