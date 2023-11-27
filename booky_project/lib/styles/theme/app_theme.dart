import 'package:booky_project/styles/app_styles.dart';
import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: AppColors.backgroundColorLight,
  colorScheme:
      const ColorScheme.light(tertiary: AppColors.inputBackgroundColorLight),
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.backgroundColorLight,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    filled: true,
    fillColor: AppColors.inputBackgroundColorLight,
    hintStyle: TextStyle(color: AppColors.hintColorLight),
  ),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: AppColors.backgroundColorDark,
  colorScheme:
      const ColorScheme.dark(tertiary: AppColors.inputBackgroundColorDark),
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.backgroundColorDark,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    filled: true,
    fillColor: AppColors.inputBackgroundColorDark,
    hintStyle: TextStyle(color: AppColors.hintColorDark),
  ),
);
