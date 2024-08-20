import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/constants/color_constant.dart';
import 'package:to_do_app/firebase_functions.dart';
import 'package:to_do_app/providers/theme_mode_provider.dart';
import 'package:to_do_app/widgets/task_box.dart';

class TasksTap extends StatefulWidget {
  TasksTap({super.key});

  @override
  State<TasksTap> createState() => _TasksTapState();
}

class _TasksTapState extends State<TasksTap> {
  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var provMode = Provider.of<ThemeModeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: 40, top: 40, right: 40),
          child: Text(
            "title".tr(),
          ),
        ),
        actions: [],
        toolbarHeight: 100,
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 85,
                color: primaryColor,
              ),
              CalendarTimeline(
                initialDate: dateTime,
                firstDate: DateTime.now().subtract(Duration(days: 365)),
                lastDate: DateTime.now().add(Duration(days: 365)),
                onDateSelected: (date) {
                  dateTime = date;
                  setState(() {});
                },
                leftMargin: 20,
                monthColor: greyColor,
                dayColor: greyColor,
                activeDayColor: primaryColor,
                activeBackgroundDayColor:
                    provMode.currentMode == ThemeMode.light
                        ? Colors.white
                        : darkBalckColor,
                dotColor: Color(0xFF333A47),
                selectableDayPredicate: (date) => date.day != 23,
                locale: 'en_ISO',
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          StreamBuilder(
            stream: FirebaseFunctions.getTask(dateTime),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text('something went wrong, please try again'),
                );
              }
              var tasks = snapshot.data?.docs
                      .map(
                        (e) => e.data(),
                      )
                      .toList() ??
                  [];

              if (tasks.isEmpty) {
                return Text('no tasks');
              }
              return Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return TaskBox(
                        task: tasks[index],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 30,
                      );
                    },
                    itemCount: tasks.length),
              );
            },
          )
        ],
      ),
    );
  }
}
