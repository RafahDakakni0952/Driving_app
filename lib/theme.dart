

import 'package:flutter/material.dart';

class MyThemes{
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(),
    primaryColor: Colors.white,
    iconTheme: const IconThemeData(color: Colors.white),

  );

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black87,
    colorScheme: const ColorScheme.dark(),
    primaryColor: Colors.white10,
    iconTheme: const IconThemeData(color: Color.fromRGBO(196, 135, 198, 1)),
  );

}

class ThemeProvider extends ChangeNotifier{
  ThemeMode themeMode = ThemeMode.light;

  bool get isDarkMode => themeMode == ThemeMode.dark;



  void toggleTheme(bool isOn){
    themeMode = isOn? ThemeMode.dark:ThemeMode.light;
    print('x');
    notifyListeners();
  }
}