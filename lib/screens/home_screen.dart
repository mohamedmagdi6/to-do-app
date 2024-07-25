import 'package:flutter/material.dart';
import 'package:to_do_app/constants/color_constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = 'homeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

int currentIndex = 0;

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: 50, top: 60),
          child: Text(
            'To Do List',
            style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
                fontSize: 22,
                color: Colors.white),
          ),
        ),
        backgroundColor: lightPrimaryColor,
        toolbarHeight: 95,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        width: 60,
        height: 60,
        child: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
              side: BorderSide(width: 4, color: Colors.white)),
          backgroundColor: lightPrimaryColor,
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        child: BottomAppBar(
          height: 86,
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          padding: EdgeInsets.zero,
          child: BottomNavigationBar(
            onTap: (value) {
              currentIndex = value;
              setState(() {});
            },
            currentIndex: currentIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: lightPrimaryColor,
            unselectedItemColor: greyColor,
            backgroundColor: Colors.transparent,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/Icon awesome-list.png'),
                    size: 33,
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/Icon feather-settings.png'),
                    size: 33,
                  ),
                  label: ''),
            ],
          ),
        ),
      ),
    );
  }
}
