import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/constants/color_constant.dart';
import 'package:to_do_app/providers/theme_mode_provider.dart';
import 'package:to_do_app/taps/setting_tap.dart';
import 'package:to_do_app/taps/tasks_tap.dart';
import 'package:to_do_app/widgets/add_task_bottom_sheet.dart';

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
    var provMode = Provider.of<ThemeModeProvider>(context);

    return Scaffold(
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        width: 60,
        height: 60,
        child: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              backgroundColor: provMode.currentMode == ThemeMode.light
                  ? Colors.white
                  : darkBalckColor,
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: AddTaskBootomSheet(),
                );
              },
            );
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: primaryColor,
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
      body: taps[currentIndex],
    );
  }

  List<Widget> taps = [TasksTap(), SettingTap()];
}
