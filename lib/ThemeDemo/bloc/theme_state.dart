part of 'theme_cubit.dart';

class ThemeState {
  final ThemeData? themeData;
  final bool isDark;
  ThemeState({required this.themeData, required this.isDark});

  List<Object> get props => [this.themeData!, this.isDark];
}
