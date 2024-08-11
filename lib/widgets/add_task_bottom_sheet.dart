import 'package:flutter/material.dart';
import 'package:to_do_app/constants/color_constant.dart';
import 'package:to_do_app/firebase_functions.dart';
import 'package:to_do_app/task_model.dart';
import 'package:to_do_app/widgets/custom_button.dart';
import 'package:to_do_app/widgets/custom_text_field.dart';

class AddTaskBootomSheet extends StatefulWidget {
  const AddTaskBootomSheet({super.key});

  @override
  State<AddTaskBootomSheet> createState() => _AddTaskBootomSheetState();
}

class _AddTaskBootomSheetState extends State<AddTaskBootomSheet> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController subTitleController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  DateTime selectionDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32, left: 44, right: 44),
      child: Form(
        key: formKey,
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
              controller: titleController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              hintText: 'enter your task',
              color: Color(0xFFA9A9A9),
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              controller: subTitleController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              hintText: 'Description',
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
            InkWell(
              onTap: () async {
                DateTime? chosenDate = await showDatePicker(
                  context: context,
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(
                    Duration(days: 365),
                  ),
                  initialDate: selectionDate,
                  builder: (context, child) {
                    return Theme(
                        data: ThemeData.light().copyWith(
                            colorScheme: ColorScheme.light(
                          primary: primaryColor,
                        )),
                        child: child!);
                  },
                );
                if (chosenDate != null) {
                  selectionDate = chosenDate;
                  setState(() {});
                }
              },
              child: Text(
                selectionDate.toString().substring(0, 10),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    color: Color(0xFFA9A9A9)),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            customButton(
              buttonName: 'Add TAsk',
              color: primaryColor,
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  TaskModel task = TaskModel(
                      date: DateUtils.dateOnly(selectionDate)
                          .millisecondsSinceEpoch,
                      title: titleController.text,
                      subTitle: subTitleController.text);
                  FirebaseFunctions.addTask(task).then(
                    (value) {
                      Navigator.pop(context);
                    },
                  );
                }
              },
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
