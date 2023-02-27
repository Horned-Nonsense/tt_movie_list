import 'package:flutter/material.dart';

abstract class MovieTextStyle {
  static const TextStyle appBarTitleTextStyle = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    fontFamily: 'Lato'
  );

  static const TextStyle moviesNameTextStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w500,
    fontFamily: 'Lato'
  );

  static const TextStyle infoTextStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    fontFamily: 'Lato'
  );

  static const TextStyle tileMoviesNameTextStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    fontFamily: 'Lato'
  );

  static const TextStyle tileInfoTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontFamily: 'Lato'
  );
}
