import 'package:flutter/material.dart';
import 'package:to_do_app/constants/color_constant.dart';

class SettingTap extends StatelessWidget {
  const SettingTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: 40, top: 40),
          child: Text(
            'Settings',
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 85,
            color: lightPrimaryColor,
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 38),
            child: Text(
              'Language',
              style: TextStyle(
                  fontFamily: 'Poppins-Medium',
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: Colors.black),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 56),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'English',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: lightPrimaryColor),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down_outlined,
                      color: lightPrimaryColor,
                      size: 20,
                    )
                  ],
                ),
              ),
              height: 48,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: lightPrimaryColor,
                    width: 1,
                  )),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 38),
            child: Text(
              'Mode',
              style: TextStyle(
                  fontFamily: 'Poppins-Medium',
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: Colors.black),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 56),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Light',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: lightPrimaryColor),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down_outlined,
                      color: lightPrimaryColor,
                      size: 20,
                    )
                  ],
                ),
              ),
              height: 48,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: lightPrimaryColor,
                    width: 1,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
