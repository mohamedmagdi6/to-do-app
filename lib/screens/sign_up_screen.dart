import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/constants/color_constant.dart';
import 'package:to_do_app/firebase_functions.dart';
import 'package:to_do_app/providers/theme_mode_provider.dart';
import 'package:to_do_app/screens/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});
  static const routeName = 'signUpScreen';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    var provMode = Provider.of<ThemeModeProvider>(context);
    return ScaffoldMessenger(
      key: scaffoldMessengerKey,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            height: MediaQuery.of(context).size.height - 50,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    const SizedBox(height: 60.0),
                    Text(
                      "signUpTitle".tr(),
                      style: TextStyle(
                        color: provMode.currentMode == ThemeMode.light
                            ? darkBalckColor
                            : Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "signUpSupTitle".tr(),
                      style: TextStyle(
                        fontSize: 15,
                        color: provMode.currentMode == ThemeMode.light
                            ? Colors.grey[700]
                            : Colors.white54,
                      ),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    TextFormField(
                      controller: userNameController,
                      decoration: InputDecoration(
                          hintStyle: TextStyle(
                            color: provMode.currentMode == ThemeMode.light
                                ? darkBalckColor
                                : Colors.white,
                          ),
                          hintText: "signUpUserNameTextField".tr(),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide.none),
                          fillColor: provMode.currentMode == ThemeMode.light
                              ? primaryColor.withOpacity(0.1)
                              : primaryColor.withOpacity(0.3),
                          filled: true,
                          prefixIcon: Icon(
                            Icons.person,
                            color: provMode.currentMode == ThemeMode.light
                                ? darkBalckColor
                                : Colors.white,
                          )),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                          hintStyle: TextStyle(
                            color: provMode.currentMode == ThemeMode.light
                                ? darkBalckColor
                                : Colors.white,
                          ),
                          hintText: "signUpEmailTextField".tr(),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide.none),
                          fillColor: provMode.currentMode == ThemeMode.light
                              ? primaryColor.withOpacity(0.1)
                              : primaryColor.withOpacity(0.3),
                          filled: true,
                          prefixIcon: Icon(
                            Icons.email,
                            color: provMode.currentMode == ThemeMode.light
                                ? darkBalckColor
                                : Colors.white,
                          )),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: phoneController,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(
                          color: provMode.currentMode == ThemeMode.light
                              ? darkBalckColor
                              : Colors.white,
                        ),
                        hintText: "signUpPhoneTextField".tr(),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide.none),
                        fillColor: provMode.currentMode == ThemeMode.light
                            ? primaryColor.withOpacity(0.1)
                            : primaryColor.withOpacity(0.3),
                        filled: true,
                        prefixIcon: Icon(
                          Icons.phone,
                          color: provMode.currentMode == ThemeMode.light
                              ? darkBalckColor
                              : Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(
                          color: provMode.currentMode == ThemeMode.light
                              ? darkBalckColor
                              : Colors.white,
                        ),
                        hintText: "signUpPasswordTextField".tr(),
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
                  ],
                ),
                Container(
                    padding: const EdgeInsets.only(top: 3, left: 3),
                    child: ElevatedButton(
                      onPressed: () {
                        FirebaseFunctions.createAccount(
                            emailAddress: emailController.text,
                            password: passwordController.text,
                            userName: userNameController.text,
                            phone: phoneController.text,
                            onSucsses: () {
                              showSnack("snackBar".tr());
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                LoginScreen.routeName,
                                (route) => false,
                              );
                            },
                            onError: (e) {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  backgroundColor: provMode.currentMode ==
                                          ThemeMode.light
                                      ? lightBackgroundColor.withOpacity(0.9)
                                      : primaryColor.withOpacity(0.9),
                                  title: Text("signUpDialogError".tr()),
                                  content: Text(e.toString()),
                                  actions: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "signUpDialogButton".tr(),
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      style: ButtonStyle(
                                        backgroundColor: WidgetStatePropertyAll(
                                            provMode.currentMode ==
                                                    ThemeMode.light
                                                ? primaryColor.withOpacity(0.8)
                                                : darkBackgrounColor
                                                    .withOpacity(0.8)),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            });
                      },
                      child: Text(
                        "singUpButton".tr(),
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: primaryColor,
                      ),
                    )),
                const Center(child: Text("Or")),
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: primaryColor,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: provMode.currentMode == ThemeMode.light
                            ? Colors.white.withOpacity(0.5)
                            : primaryColor.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset:
                            const Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 30.0,
                          width: 30.0,
                          decoration: const BoxDecoration(
                            color: lightBackgroundColor,
                            image: DecorationImage(
                                image: AssetImage('assets/images/aZqAl.png'),
                                fit: BoxFit.cover),
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 18),
                        Text(
                          "googleButton".tr(),
                          style: TextStyle(
                            fontSize: 16,
                            color: provMode.currentMode == ThemeMode.light
                                ? primaryColor
                                : Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "alredyHaveAccount".tr(),
                      style: TextStyle(
                        color: provMode.currentMode == ThemeMode.light
                            ? darkBalckColor
                            : Colors.white,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "login".tr(),
                          style: TextStyle(color: primaryColor, fontSize: 20),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showSnack(String title) {
    final snackbar = SnackBar(
        content: Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 15,
      ),
    ));
    scaffoldMessengerKey.currentState!.showSnackBar(snackbar);
  }
}
