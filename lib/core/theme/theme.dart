import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  appBarTheme: const AppBarTheme(
      color: Colors.white,
      iconTheme: IconThemeData(color: Colors.black),
      elevation: 0,
  titleTextStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 16)),
  textTheme: TextTheme(
    bodyLarge: const TextStyle(
        fontSize: 24, fontWeight: FontWeight.w700, color: Colors.black),

    bodyMedium: TextStyle(
        fontSize: 16, fontWeight: FontWeight.w700, color: Colors.grey.shade500),

    bodySmall: const TextStyle(
        fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),

    displayMedium: const TextStyle(
        fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black),
  ),
);
