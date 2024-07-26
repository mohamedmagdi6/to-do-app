import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/constants/color_constant.dart';

class TasksTap extends StatelessWidget {
  const TasksTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
            )
          ],
        ),
      ],
    );
  }
}
