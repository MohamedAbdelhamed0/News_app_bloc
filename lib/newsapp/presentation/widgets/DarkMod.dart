import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData DarkThemeData(context) {
  return ThemeData(
      primarySwatch: Colors.deepOrange,
      highlightColor: Colors.deepOrange[50],
      primaryColor: Colors.deepOrange,
      appBarTheme: const AppBarTheme(
        titleSpacing: 8,
        color: Colors.black,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.black,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      scaffoldBackgroundColor: Colors.black,
      textTheme: const TextTheme(
          headline1: TextStyle(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.deepOrange));
}
