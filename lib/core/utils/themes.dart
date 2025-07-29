import 'package:flutter/material.dart';
import 'package:recipe/core/utils/colors.dart';

class AppThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.beige,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.beige,
      surfaceTintColor: Colors.transparent,
    ),
    fontFamily: "Poppins",
  );

  static final lightTheme = ThemeData(
    fontFamily: "Poppins",
  ); // keyin yoziladi
}
