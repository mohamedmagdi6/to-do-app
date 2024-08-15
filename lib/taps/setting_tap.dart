import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/constants/color_constant.dart';
import 'package:to_do_app/providers/theme_mode_provider.dart';

class SettingTap extends StatelessWidget {
  SettingTap({super.key});
  var sellectedMode = 'Light';
  var sellectedlang = 'English';

  @override
  Widget build(BuildContext context) {
    var provMode = Provider.of<ThemeModeProvider>(context);
    return Scaffold(
      backgroundColor: provMode.currentMode == ThemeMode.light
          ? lightBackgroundColor
          : darkBackgrounColor,
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: 40, top: 40),
          child: Text(
            'Settings',
            style: TextStyle(
              fontFamily: 'Poppins-Medium',
              fontWeight: FontWeight.w700,
              fontSize: 22,
              color: provMode.currentMode == ThemeMode.light
                  ? Colors.white
                  : darkBalckColor,
            ),
          ),
        ),
        backgroundColor: primaryColor,
        toolbarHeight: 100,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 85,
            color: primaryColor,
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 38),
            child: Text(
              'Language',
              style: TextStyle(
                  fontFamily: 'Poppins-Medium',
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: Colors.black),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 56),
            child: Container(
              child: DropdownButton(
                items: [
                  DropdownMenuItem(
                    value: 'English',
                    child: Text('English'),
                  ),
                  DropdownMenuItem(
                    value: 'Arabic',
                    child: Text('Arabic'),
                  )
                ],
                value: sellectedlang,
                onChanged: (va) {
                  sellectedlang = va!;
                },
                dropdownColor: provMode.currentMode == ThemeMode.light
                    ? Colors.white
                    : darkBalckColor,
                isExpanded: true,
                icon: Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: primaryColor,
                  size: 20,
                ),
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: primaryColor),
              ),
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  color: provMode.currentMode == ThemeMode.light
                      ? Colors.white
                      : darkBalckColor,
                  border: Border.all(
                    color: primaryColor,
                    width: 1,
                  )),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 38),
            child: Text(
              'Mode',
              style: TextStyle(
                  fontFamily: 'Poppins-Medium',
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: Colors.black),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 56),
            child: Container(
              child: DropdownButton(
                items: [
                  DropdownMenuItem(
                    value: 'Light',
                    child: Text('Light'),
                  ),
                  DropdownMenuItem(
                    value: 'Dark',
                    child: Text('Dark'),
                  )
                ],
                value: sellectedMode,
                onChanged: (va) {
                  sellectedMode = va!;
                  if (sellectedMode == 'Light') {
                    provMode.changeTheme(ThemeMode.light);
                  } else {
                    provMode.changeTheme(ThemeMode.dark);
                  }
                },
                dropdownColor: provMode.currentMode == ThemeMode.light
                    ? Colors.white
                    : darkBalckColor,
                isExpanded: true,
                icon: Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: primaryColor,
                  size: 20,
                ),
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: primaryColor),
              ),
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  color: provMode.currentMode == ThemeMode.light
                      ? Colors.white
                      : darkBalckColor,
                  border: Border.all(
                    color: primaryColor,
                    width: 1,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
