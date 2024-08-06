import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:to_do_app/constants/color_constant.dart';
import 'package:to_do_app/screens/edit_task_screen.dart';

class TaskBox extends StatelessWidget {
  const TaskBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 33),
      child: Slidable(
        startActionPane: ActionPane(
          extentRatio: 0.25,
          motion: ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {},
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
              Navigator.pushNamed(context, EditTaskScreen.routeName);
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
            color: Colors.white,
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
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Play baxket ball',
                      style: TextStyle(
                        color: primaryColor,
                        fontFamily: 'Poppins-Medium',
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: ImageIcon(
                            AssetImage(
                              'assets/images/Discovery.png',
                            ),
                            size: 20,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text('10:30 AM'),
                      ],
                    )
                  ],
                ),
                Spacer(
                  flex: 2,
                ),
                Container(
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
