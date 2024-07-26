import 'package:flutter/material.dart';
import 'package:to_do_app/constants/color_constant.dart';

class TaskBox extends StatelessWidget {
  const TaskBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 33),
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
                  color: lightPrimaryColor,
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
                      color: lightPrimaryColor,
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
                  color: lightPrimaryColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
