import 'package:flutter/material.dart';
import 'package:tamatar/Shared/style_sheet.dart';

var customTheme = ThemeData(
  primaryColor: kbackgroundDark,
  textTheme: const TextTheme(
    bodyMedium: TextStyle(fontSize: 15, color: Colors.white),
  ),
  scaffoldBackgroundColor: kbackgroundDark,
  iconButtonTheme: const IconButtonThemeData(
    style: ButtonStyle(
      iconColor: MaterialStatePropertyAll(kcolor2),
    ),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: kbackgroundDark,
    foregroundColor: Colors.white,
  ),
  bottomAppBarTheme: const BottomAppBarTheme(
    color: kbackgroundDark,
  ),
);
