import 'package:flutter/material.dart';

import 'colors.dart';

class AppTheme {
  const AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    fontFamily: "Montserrat",
    scaffoldBackgroundColor: backgroundColorLight,
    extensions: const [
      AppColors(
        text: textColorLight,
        secondary: secondaryColorLight,
        primary: primaryColorLight,
        background: backgroundColorLight,
        shadow: shadowColorLight,
        error: errorColorLight,
      )
    ],
  );
}