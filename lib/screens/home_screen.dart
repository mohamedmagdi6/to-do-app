import 'package:flutter/material.dart';
import 'package:to_do_app/constants/color_constant.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const routeName = 'homeScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      appBar: AppBar(
        title: Text(
          'To Do List',
        ),
      ),
    );
  }
}
