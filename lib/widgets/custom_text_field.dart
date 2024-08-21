import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/constants/color_constant.dart';
import 'package:to_do_app/providers/theme_mode_provider.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField(
      {required this.hintText, this.color, this.validator, this.controller});
  String hintText;
  Color? color;
  final String? Function(String?)? validator;
  TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    var provMode = Provider.of<ThemeModeProvider>(context);
    return TextFormField(
      style: TextStyle(
          color: provMode.currentMode == ThemeMode.light
              ? darkBalckColor
              : Colors.white),
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
          color: Color(0xFF383838),
        )),
        hintText: hintText,
        hintStyle: TextStyle(
          color: color == null ? Color(0xFF383838) : color,
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
