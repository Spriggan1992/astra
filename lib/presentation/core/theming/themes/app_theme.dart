import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = _buildLightAppTheme();

  static ThemeData _buildLightAppTheme() {
    final ThemeData base = ThemeData.light();
    return base.copyWith(
      textTheme: _lightTextTheme(base.textTheme),
      // appBarTheme: _lightAppBarTheme(base.appBarTheme),
      // backgroundColor: textWhait,
      // accentColor: textBlack,
      // scaffoldBackgroundColor: textWhait,
      // cardTheme: _lightCardTheme(base.cardTheme),
      // bottomNavigationBarTheme: base.bottomNavigationBarTheme.copyWith(
      //   selectedItemColor: Colors.green,
      //   selectedLabelStyle: TextStyle(color: Colors.green),
      //   unselectedItemColor: Colors.grey,
      //   selectedIconTheme: base.iconTheme.copyWith(
      //     color: Colors.green,
      //   ),
      // ),

      //_lightBarThemeData(base.bottomNavigationBarTheme),
      //textTheme: _lightTextTheme(base.textTheme),
    );
  }

  static _lightTextTheme(TextTheme baseTextTheme) {
    return baseTextTheme.copyWith();
  }
}
