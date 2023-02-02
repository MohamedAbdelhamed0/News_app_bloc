import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData LIghtThemeData(context) {
  return ThemeData(
    highlightColor: Colors.deepOrange[50],
    primarySwatch: Colors.deepOrange,
    primaryColor: Colors.deepOrange,
    scaffoldBackgroundColor: Colors.white,
    // ignore: prefer_const_constructors
    appBarTheme: AppBarTheme(
      titleSpacing: 8,
      elevation: 0.0,
      // ignore: prefer_const_constructors
      titleTextStyle: TextStyle(
          color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
      actionsIconTheme: const IconThemeData(
        color: Colors.black,
        size: 25,
      ),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),

      backgroundColor: Colors.white,
    ),
    dividerColor: Colors.white,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      elevation: 100,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.deepOrange,
    ),
    textTheme: const TextTheme(
        headline1: TextStyle(fontSize: 18, color: Colors.black)),
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepOrange)
        .copyWith(secondary: Colors.deepOrange),
  );
}
