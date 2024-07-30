import 'package:flutter/material.dart';

// ignore: must_be_immutable
class customButton extends StatelessWidget {
  customButton(
      {super.key,
      required this.buttonName,
      required this.color,
      required this.onPressed});
  Color color;
  String buttonName;
  void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(color),
          padding: const WidgetStatePropertyAll(
            EdgeInsets.symmetric(vertical: 20),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          buttonName,
          style: const TextStyle(
            fontFamily: 'Inter',
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ));
  }
}
