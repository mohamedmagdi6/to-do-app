import 'package:flutter/material.dart';
import 'package:to_do_app/constants/color_constant.dart';
import 'package:to_do_app/widgets/custom_button.dart';
import 'package:to_do_app/widgets/custom_text_field.dart';

class EditTaskScreen extends StatelessWidget {
  const EditTaskScreen({super.key});
  static const routeName = 'editTaskScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(
          'To Do List',
          style: TextStyle(
              fontFamily: 'Poppins-Medium',
              fontWeight: FontWeight.w700,
              fontSize: 22,
              color: Colors.white),
        ),
        backgroundColor: lightPrimaryColor,
        toolbarHeight: 100,
      ),
      body: Stack(
        children: [
          Container(
            height: 85,
            color: lightPrimaryColor,
          ),
          Padding(
              padding: const EdgeInsets.only(left: 33, right: 33, top: 30),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.7,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Edit Task',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            color: Color(0xFF383838)),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      CustomTextField(hintText: 'This is title'),
                      SizedBox(
                        height: 30,
                      ),
                      CustomTextField(hintText: 'Task details'),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Select time',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                            color: Color(0xFF383838)),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        '27-6-2021',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            color: Color(0xFFA9A9A99C)),
                        textAlign: TextAlign.center,
                      ),
                      Spacer(),
                      customButton(
                        buttonName: 'Save Cahnges',
                        color: lightPrimaryColor,
                        onPressed: () {},
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
