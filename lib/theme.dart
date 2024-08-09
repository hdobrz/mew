import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData;
  Color _bottomNavBarColor;
  BottomNavigationBarType _bottomNavBarType;

  ThemeProvider()
      : _themeData = _lightTheme,
        _bottomNavBarColor = const Color(0xFF037165),
        _bottomNavBarType = BottomNavigationBarType.fixed;

  ThemeData getTheme() => _themeData;

  Color getBottomNavBarColor() => _bottomNavBarColor;

  BottomNavigationBarType getBottomNavBarType() => _bottomNavBarType;

  void toggleTheme() {
    if (_themeData == _lightTheme) {
      _themeData = _darkTheme;
    } else {
      _themeData = _lightTheme;
    }
    notifyListeners();
  }

  void setBottomNavBarColor(Color color) {
    _bottomNavBarColor = color;
    notifyListeners();
  }

  void setBottomNavBarType(BottomNavigationBarType type) {
    _bottomNavBarType = type;
    notifyListeners();
  }

  static final ThemeData _lightTheme = ThemeData(
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF037165), // اللون الأساسي في الوضع النهاري
      onPrimary: Colors.white,
      secondary: Colors.white,
      onSecondary: Colors.black,
    ),
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF037165), // اللون الأساسي في الوضع النهاري
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
      iconTheme: IconThemeData(color: Colors.white),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF037165), // اللون الأساسي في الوضع النهاري
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      selectedLabelStyle: TextStyle(
        color: Colors.white,
        shadows: [
          Shadow(
            offset: Offset(1.0, 1.0),
            blurRadius: 3.0,
            color: Color.fromARGB(128, 0, 0, 0),
          ),
        ],
      ),
      unselectedLabelStyle: TextStyle(
        color: Colors.grey,
        shadows: [
          Shadow(
            offset: Offset(1.0, 1.0),
            blurRadius: 3.0,
            color: Color.fromARGB(128, 0, 0, 0),
          ),
        ],
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black),
      bodyMedium: TextStyle(color: Colors.black54),
    ),
  );

  static final ThemeData _darkTheme = ThemeData(
    colorScheme: const ColorScheme.dark(
      primary: Color(0x01221FFF), // اللون الأساسي في الوضع الليلي
      onPrimary: Colors.white,
      secondary: Colors.white, // اللون الثانوي في الوضع الليلي
      onSecondary: Colors.white,
    ),
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0x01221FFF),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0x01221FFF),
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
      iconTheme: IconThemeData(color: Colors.white),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0x01221FFF), // اللون الأساسي في الوضع الليلي
      selectedItemColor: Colors.white, // اللون الثانوي في الوضع الليلي
      unselectedItemColor: Colors.grey,
      selectedLabelStyle: TextStyle(
        color: Colors.white, // اللون الثانوي في الوضع الليلي
        shadows: [
          Shadow(
            offset: Offset(1.0, 1.0),
            blurRadius: 3.0,
            color: Color.fromARGB(128, 0, 0, 0),
          ),
        ],
      ),
      unselectedLabelStyle: TextStyle(
        color: Colors.grey,
        shadows: [
          Shadow(
            offset: Offset(1.0, 1.0),
            blurRadius: 3.0,
            color: Color.fromARGB(128, 0, 0, 0),
          ),
        ],
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white70),
    ),
  );
}
