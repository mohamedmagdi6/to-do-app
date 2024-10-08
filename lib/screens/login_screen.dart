import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/constants/color_constant.dart';
import 'package:to_do_app/firebase_functions.dart';
import 'package:to_do_app/providers/cache_current_user_provider.dart';
import 'package:to_do_app/providers/theme_mode_provider.dart';
import 'package:to_do_app/screens/home_screen.dart';
import 'package:to_do_app/screens/sign_up_screen.dart';
import 'package:to_do_app/taps/tasks_tap.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  static const routeName = 'liginScreen';
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _header(context),
            _inputField(context),
            _forgotPassword(context),
            _signup(context),
          ],
        ),
      ),
    );
  }

  _header(context) {
    var provMode = Provider.of<ThemeModeProvider>(context);

    return Column(
      children: [
        Text(
          "loginTitle".tr(),
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: provMode.currentMode == ThemeMode.light
                ? darkBalckColor
                : Colors.white,
          ),
        ),
        Text(
          "loginSubTitle".tr(),
          style: TextStyle(
            fontSize: 15,
            color: provMode.currentMode == ThemeMode.light
                ? Colors.grey[700]
                : Colors.white54,
          ),
        ),
      ],
    );
  }

  _inputField(context) {
    var provMode = Provider.of<ThemeModeProvider>(context);
    var provcache = Provider.of<CacheCurrentUserProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFormField(
          controller: emailController,
          style: TextStyle(
              color: provMode.currentMode == ThemeMode.light
                  ? darkBalckColor
                  : Colors.white),
          decoration: InputDecoration(
            hintStyle: TextStyle(
              color: provMode.currentMode == ThemeMode.light
                  ? darkBalckColor
                  : Colors.white,
            ),
            hintText: "loginEmailTextField".tr(),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none),
            fillColor: provMode.currentMode == ThemeMode.light
                ? primaryColor.withOpacity(0.1)
                : primaryColor.withOpacity(0.3),
            filled: true,
            prefixIcon: Icon(
              Icons.alternate_email,
              color: provMode.currentMode == ThemeMode.light
                  ? darkBalckColor
                  : Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          style: TextStyle(
              color: provMode.currentMode == ThemeMode.light
                  ? darkBalckColor
                  : Colors.white),
          controller: passwordController,
          decoration: InputDecoration(
            hintStyle: TextStyle(
              color: provMode.currentMode == ThemeMode.light
                  ? darkBalckColor
                  : Colors.white,
            ),
            hintText: "loginPasswordTextField".tr(),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none),
            fillColor: provMode.currentMode == ThemeMode.light
                ? primaryColor.withOpacity(0.1)
                : primaryColor.withOpacity(0.3),
            filled: true,
            prefixIcon: Icon(
              Icons.password,
              color: provMode.currentMode == ThemeMode.light
                  ? darkBalckColor
                  : Colors.white,
            ),
          ),
          obscureText: true,
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            FirebaseFunctions.login(
                emailController.text, passwordController.text, onSucsses: () {
              provcache.getuser();
              Future.delayed(Duration(seconds: 1), () {
                Navigator.pushReplacementNamed(context, HomeScreen.routeName);
              });
            }, onError: (e) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: provMode.currentMode == ThemeMode.light
                      ? lightBackgroundColor.withOpacity(0.9)
                      : primaryColor.withOpacity(0.9),
                  title: Text("LoginDialogError".tr()),
                  content: Text(e.toString()),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "LoginDialogButton".tr(),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                            provMode.currentMode == ThemeMode.light
                                ? primaryColor.withOpacity(0.8)
                                : darkBackgrounColor.withOpacity(0.8)),
                      ),
                    )
                  ],
                ),
              );
            });
          },
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(vertical: 16),
            backgroundColor: primaryColor,
          ),
          child: Text(
            "loginButton".tr(),
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        )
      ],
    );
  }

  _forgotPassword(context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        "forgotPassword".tr(),
        style: TextStyle(color: primaryColor),
      ),
    );
  }

  _signup(context) {
    var provMode = Provider.of<ThemeModeProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "dontHaveAccount".tr(),
          style: TextStyle(
            color: provMode.currentMode == ThemeMode.light
                ? darkBalckColor
                : Colors.white,
          ),
        ),
        TextButton(
            onPressed: () {
              Navigator.pushNamed(context, SignUpScreen.routeName);
            },
            child: Text(
              "signUp".tr(),
              style: TextStyle(color: primaryColor),
            ))
      ],
    );
  }
}
