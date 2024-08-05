import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField({required this.hintText, this.color});
  String hintText;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return TextField(
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
