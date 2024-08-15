import 'package:flutter/material.dart';
import 'package:to_do_app/constants/color_constant.dart';

class MyThemData {
  static ThemeData lightTheme = ThemeData(
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(width: 4, color: Colors.white)),
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      color: Colors.white,
    ),
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
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(width: 4, color: darkBalckColor)),
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      color: darkBalckColor,
    ),
    appBarTheme: const AppBarTheme(
        backgroundColor: primaryColor,
        titleTextStyle: TextStyle(
            fontFamily: 'Poppins-Medium',
            fontWeight: FontWeight.w700,
            fontSize: 22,
            color: darkBalckColor)),
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
