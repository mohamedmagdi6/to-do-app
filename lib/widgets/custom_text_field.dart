import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField({required this.hintText});
  String hintText;

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
          color: Color(0xFF383838),
          fontSize: 18,
        ),
      ),
    );
  }
}
