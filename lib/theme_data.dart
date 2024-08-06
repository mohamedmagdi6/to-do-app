import 'package:flutter/material.dart';
import 'package:to_do_app/constants/color_constant.dart';

class MyThemData {
  static ThemeData lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
        backgroundColor: primaryColor,
        toolbarHeight: 100,
        titleTextStyle: TextStyle(
            fontFamily: 'Poppins-Medium',
            fontWeight: FontWeight.w700,
            fontSize: 22,
            color: Colors.white)),
    scaffoldBackgroundColor: lightBackgroundColor,
    fontFamily: 'Poppins-Medium',
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: primaryColor,
      unselectedItemColor: greyColor,
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
  );

  // light mode.
  static ThemeData darkTheme = ThemeData(
    appBarTheme: const AppBarTheme(
        backgroundColor: primaryColor,
        titleTextStyle: TextStyle(
            fontFamily: 'Poppins-Medium',
            fontWeight: FontWeight.w700,
            fontSize: 22,
            color: Colors.white)),
    scaffoldBackgroundColor: darkBackgrounColor,
    fontFamily: 'Poppins-Medium',
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: primaryColor,
      unselectedItemColor: greyColor,
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
  );
}
