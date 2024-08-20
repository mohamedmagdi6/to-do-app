import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/constants/color_constant.dart';
import 'package:to_do_app/providers/theme_mode_provider.dart';
import 'package:to_do_app/screens/login_screen.dart';

class SettingTap extends StatelessWidget {
  SettingTap({super.key});

  List<String> languages = ["english", "arabic"];
  String? choosenValue;
  List<String> themes = ["light", "dark"];
  String? choosenMode;

  @override
  Widget build(BuildContext context) {
    var provMode = Provider.of<ThemeModeProvider>(context);
    Locale currentLocale = Localizations.localeOf(context);
    return Scaffold(
      backgroundColor: provMode.currentMode == ThemeMode.light
          ? lightBackgroundColor
          : darkBackgrounColor,
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: 40, top: 40, right: 40),
          child: Text(
            "settingTitle".tr(),
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
        actions: [
          InkWell(
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushNamedAndRemoveUntil(
                  context, LoginScreen.routeName, (route) => false);
            },
            child: Padding(
              padding: EdgeInsets.only(
                  right: currentLocale.languageCode == 'en' ? 40 : 10,
                  top: 30,
                  left: currentLocale.languageCode == 'en' ? 10 : 40),
              child: ImageIcon(
                AssetImage('assets/images/log-out.png'),
                size: 30,
                color: provMode.currentMode == ThemeMode.light
                    ? primaryColor
                    : darkBalckColor,
              ),
            ),
          ),
        ],
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
            padding: const EdgeInsets.only(left: 38, right: 38),
            child: Text(
              "language".tr(),
              style: TextStyle(
                fontFamily: 'Poppins-Medium',
                fontWeight: FontWeight.w700,
                fontSize: 14,
                color: provMode.currentMode == ThemeMode.light
                    ? darkBalckColor
                    : primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 56),
            child: Container(
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
              child: DropdownButtonFormField(
                items: languages.map((valueItem) {
                  return DropdownMenuItem(
                    value: valueItem,
                    child: Text(
                      valueItem.tr(),
                    ),
                  );
                }).toList(),
                hint: Text(
                  "selectLang".tr(),
                  style: TextStyle(
                    color: provMode.currentMode == ThemeMode.light
                        ? Color(0xFFA9A9A9)
                        : primaryColor,
                  ),
                ),
                value: choosenValue,
                onChanged: (va) {
                  choosenValue = va!;
                  if (choosenValue == languages[0]) {
                    context.setLocale(Locale('en'));
                  } else {
                    context.setLocale(Locale('ar'));
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
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 38, right: 38),
            child: Text(
              "mode".tr(),
              style: TextStyle(
                  fontFamily: 'Poppins-Medium',
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: provMode.currentMode == ThemeMode.light
                      ? darkBalckColor
                      : primaryColor),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 56),
            child: Container(
              child: DropdownButtonFormField(
                items: themes.map((themesKey) {
                  return DropdownMenuItem(
                      value: themesKey, child: Text(themesKey.tr()));
                }).toList(),
                hint: Text(
                  "selectMode".tr(),
                  style: TextStyle(
                    color: provMode.currentMode == ThemeMode.light
                        ? Color(0xFFA9A9A9)
                        : primaryColor,
                  ),
                ),
                value: choosenMode,
                onChanged: (va) {
                  choosenMode = va!;
                  if (choosenMode == themes[0]) {
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
