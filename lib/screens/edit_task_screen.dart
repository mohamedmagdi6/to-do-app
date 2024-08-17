import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/constants/color_constant.dart';
import 'package:to_do_app/firebase_functions.dart';
import 'package:to_do_app/models/task_model.dart';
import 'package:to_do_app/providers/theme_mode_provider.dart';
import 'package:to_do_app/widgets/custom_button.dart';
import 'package:to_do_app/widgets/custom_text_field.dart';

class EditTaskScreen extends StatefulWidget {
  EditTaskScreen({super.key});
  static const routeName = 'editTaskScreen';

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  TextEditingController titleController = TextEditingController();

  TextEditingController subtitleController = TextEditingController();

  DateTime selectionDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var task = ModalRoute.of(context)!.settings.arguments as TaskModel;
    var provMode = Provider.of<ThemeModeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: provMode.currentMode == ThemeMode.light
            ? Colors.white
            : darkBalckColor,
        title: Text(
          "title".tr(),
          style: TextStyle(
            fontFamily: 'Poppins-Medium',
            fontWeight: FontWeight.w700,
            fontSize: 22,
            color: provMode.currentMode == ThemeMode.light
                ? Colors.white
                : darkBalckColor,
          ),
        ),
        backgroundColor: primaryColor,
        toolbarHeight: 100,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 85,
              color: primaryColor,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 33, right: 33, top: 30),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  decoration: BoxDecoration(
                    color: provMode.currentMode == ThemeMode.light
                        ? Colors.white
                        : darkBalckColor.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "editTitle".tr(),
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            color: provMode.currentMode == ThemeMode.light
                                ? Color(0xFF383838)
                                : primaryColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        CustomTextField(
                            color: provMode.currentMode == ThemeMode.light
                                ? Color(0xFF383838)
                                : primaryColor,
                            controller: titleController,
                            hintText: "editTitleTextField".tr()),
                        SizedBox(
                          height: 30,
                        ),
                        CustomTextField(
                            color: provMode.currentMode == ThemeMode.light
                                ? Color(0xFF383838)
                                : primaryColor,
                            controller: subtitleController,
                            hintText: "editDiscriptionTextField".tr()),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "editSelsctedTime".tr(),
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                            color: provMode.currentMode == ThemeMode.light
                                ? Color(0xFF383838)
                                : primaryColor,
                          ),
                        ),
                        SizedBox(
                          height: 30,
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
                              color: provMode.currentMode == ThemeMode.light
                                  ? Color(0xFFA9A9A9)
                                  : primaryColor,
                            ),
                          ),
                        ),
                        Spacer(),
                        customButton(
                          buttonName: "saveChangesButton".tr(),
                          color: primaryColor,
                          onPressed: () {
                            if (titleController.text == "") {
                              titleController.text = task.title;
                            }
                            if (subtitleController.text == "") {
                              subtitleController.text = task.subTitle;
                            }
                            task.title = titleController.text;
                            task.subTitle = subtitleController.text;
                            task.date = DateUtils.dateOnly(selectionDate)
                                .millisecondsSinceEpoch;

                            FirebaseFunctions.edit(task);
                            Navigator.pop(context);
                          },
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
