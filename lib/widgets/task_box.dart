import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/constants/color_constant.dart';
import 'package:to_do_app/firebase_functions.dart';
import 'package:to_do_app/providers/theme_mode_provider.dart';
import 'package:to_do_app/screens/edit_task_screen.dart';
import 'package:to_do_app/models/task_model.dart';

class TaskBox extends StatefulWidget {
  TaskBox({
    super.key,
    required this.task,
  });
  TaskModel task;

  @override
  State<TaskBox> createState() => _TaskBoxState();
}

class _TaskBoxState extends State<TaskBox> {
  @override
  Widget build(BuildContext context) {
    var provMode = Provider.of<ThemeModeProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 33),
      child: Slidable(
        startActionPane: ActionPane(
          extentRatio: 0.25,
          motion: ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {
                FirebaseFunctions.delete(widget.task.id);
              },
              padding: EdgeInsets.zero,
              icon: Icons.delete,
              spacing: 5,
              label: 'Delete',
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.horizontal(left: Radius.circular(15)),
            ),
          ],
        ),
        endActionPane:
            ActionPane(extentRatio: 0.25, motion: ScrollMotion(), children: [
          SlidableAction(
            onPressed: (context) {
              Navigator.pushNamed(context, EditTaskScreen.routeName,
                  arguments: widget.task);
            },
            padding: EdgeInsets.zero,
            icon: Icons.edit,
            label: 'Edit',
            backgroundColor: Colors.blue,
            borderRadius: BorderRadius.horizontal(right: Radius.circular(15)),
          ),
        ]),
        child: Container(
          decoration: BoxDecoration(
            color: provMode.currentMode == ThemeMode.light
                ? Colors.white
                : darkBalckColor,
            borderRadius: BorderRadius.circular(15),
          ),
          height: 115,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 62,
                  width: 4,
                  decoration: BoxDecoration(
                    color: widget.task.isDone == true
                        ? Color(0xFF61E757)
                        : primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.task.title,
                      style: TextStyle(
                        color: widget.task.isDone == true
                            ? Color(0xFF61E757)
                            : primaryColor,
                        fontFamily: 'Poppins-Medium',
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                        width: 200,
                        child: Text(
                          widget.task.subTitle,
                          style: TextStyle(
                            color: provMode.currentMode == ThemeMode.light
                                ? darkBalckColor
                                : Colors.white,
                          ),
                        ))
                  ],
                ),
                Spacer(
                  flex: 2,
                ),
                InkWell(
                  onTap: () {
                    widget.task.isDone = true;
                    print(widget.task.isDone);

                    FirebaseFunctions.isDone(widget.task);
                    setState(() {});
                  },
                  child: widget.task.isDone == true
                      ? Text(
                          'Done!',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700,
                              fontSize: 22,
                              color: Color(0xFF61E757)),
                        )
                      : Container(
                          width: 69,
                          height: 34,
                          child: ImageIcon(
                            AssetImage('assets/images/Icon awesome-check.png'),
                            color: Colors.white,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: primaryColor,
                          ),
                        ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
