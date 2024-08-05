import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:to_do_app/widgets/custom_text_field.dart';

class AddTaskBootomSheet extends StatelessWidget {
  const AddTaskBootomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32, left: 44, right: 44),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Add new Task',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          CustomTextField(
            hintText: 'enter your task',
            color: Color(0xFFA9A9A9),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Select time',
            style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              fontSize: 20,
            ),
          ),
          Text(
            '12:00 Am',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                fontSize: 20,
                color: Color(0xFFA9A9A9)),
          ),
          SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
