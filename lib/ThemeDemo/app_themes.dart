import 'package:flutter/material.dart';

class AppThemes {
  static final appThemeData = {
    AppTheme.lightTheme: ThemeData(
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
      ),
      brightness: Brightness.light,
      cardColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      primarySwatch: Colors.blue,
      backgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
          color: Colors.white,
          toolbarTextStyle:
              TextTheme(bodyText2: TextStyle(color: Colors.black)).bodyText2,
          titleTextStyle:
              TextTheme(bodyText2: TextStyle(color: Colors.black)).headline6),
      buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.normal),
      textTheme: TextTheme(
        bodyText1: TextStyle(color: Colors.black, fontSize: 12.0),
        bodyText2: TextStyle(color: Colors.black, fontSize: 15.0),
        headline3: TextStyle(color: Colors.black, fontSize: 18.0),
        headline4: TextStyle(color: Colors.black, fontSize: 20.0),
        headline5: TextStyle(color: Colors.black, fontSize: 22.0),
        headline6: TextStyle(color: Colors.black, fontSize: 24.0),
      ),
    ),
    AppTheme.darkTheme: ThemeData(
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
      ),
      buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.accent),
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Colors.black,
      primarySwatch: Colors.teal,
      backgroundColor: Colors.black,
      appBarTheme: AppBarTheme(color: Colors.black),
      textTheme: TextTheme(
        bodyText1: TextStyle(color: Colors.white, fontSize: 12.0),
        bodyText2: TextStyle(color: Colors.white, fontSize: 15.0),
        headline3: TextStyle(color: Colors.white, fontSize: 18.0),
        headline4: TextStyle(color: Colors.white, fontSize: 20.0),
        headline5: TextStyle(color: Colors.white, fontSize: 22.0),
        headline6: TextStyle(color: Colors.white, fontSize: 24.0),
      ),
    )
  };
}

enum AppTheme {
  lightTheme,
  darkTheme,
}
