import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/constants/color_constant.dart';
import 'package:to_do_app/widgets/task_box.dart';

class TasksTap extends StatelessWidget {
  const TasksTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: 40, top: 40),
          child: Text(
            'To Do List',
            style: TextStyle(
                fontFamily: 'Poppins-Medium',
                fontWeight: FontWeight.w700,
                fontSize: 22,
                color: Colors.white),
          ),
        ),
        backgroundColor: lightPrimaryColor,
        toolbarHeight: 100,
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 85,
                color: lightPrimaryColor,
              ),
              CalendarTimeline(
                initialDate: DateTime.now(),
                firstDate: DateTime.now().subtract(Duration(days: 365)),
                lastDate: DateTime.now().add(Duration(days: 365)),
                onDateSelected: (date) => print(date),
                leftMargin: 20,
                monthColor: greyColor,
                dayColor: greyColor,
                activeDayColor: lightPrimaryColor,
                activeBackgroundDayColor: Colors.white,
                dotColor: Color(0xFF333A47),
                selectableDayPredicate: (date) => date.day != 23,
                locale: 'en_ISO',
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return TaskBox();
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 30,
                  );
                },
                itemCount: 4),
          )
        ],
      ),
    );
  }
}
