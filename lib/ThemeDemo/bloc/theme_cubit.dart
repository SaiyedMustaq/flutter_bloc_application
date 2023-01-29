import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeData> {
  /// {@macro brightness_cubit}
  ThemeCubit() : super(_lightTheme);

  static final _lightTheme = ThemeData(
    useMaterial3: true,
    textTheme: TextTheme(
        bodyLarge: TextStyle(fontSize: 16.0),
        bodyMedium: TextStyle(fontSize: 14.0),
        bodySmall: TextStyle(fontSize: 12.0),
        headlineLarge: TextStyle(fontSize: 28.0),
        displayLarge: TextStyle(fontSize: 57.0),
        displayMedium: TextStyle(fontSize: 45.0),
        displaySmall: TextStyle(fontSize: 36.0),
        headlineMedium: TextStyle(fontSize: 28.0),
        headlineSmall: TextStyle(fontSize: 24.0),
        labelLarge: TextStyle(fontSize: 14.0),
        labelMedium: TextStyle(fontSize: 12.0),
        labelSmall: TextStyle(fontSize: 11.0),
        titleLarge: TextStyle(fontSize: 22.0),
        titleMedium: TextStyle(fontSize: 16.0),
        titleSmall: TextStyle(fontSize: 14.0)),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: Colors.white,
    ),
    brightness: Brightness.light,
  );

  static final _darkTheme = ThemeData(
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: Colors.black,
    ),
    brightness: Brightness.dark,
  );
  void toggleTheme() {
    emit(state.brightness == Brightness.dark ? _lightTheme : _darkTheme);
  }
}
