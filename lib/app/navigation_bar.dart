import 'package:finance_app/res/colors.dart';
import 'package:finance_app/app/main_screen.dart';
import 'package:finance_app/features/news_screen.dart';
import 'package:finance_app/features/settings.dart';
import 'package:finance_app/features/start_screen_widget.dart';
import 'package:finance_app/res/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({super.key});

  @override
  State<MyNavigationBar> createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  List<Widget> screens = [
    MainScreen(),
    StartScreen(),
    StartScreen(),
    NewsScreen(),
    SettingsScreen(),
  ];
  int _currentIndex = 0;
  List<String> labels = [
    AppStrings.main,
    AppStrings.analytics,
    AppStrings.calc,
    AppStrings.news,
    AppStrings.settings
  ];
  void onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 83,
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: _currentIndex == 0
                  ? SvgPicture.asset("assets/home-analytics_selected.svg")
                  : SvgPicture.asset("assets/home.svg"),
              label: labels[0],
            ),
            BottomNavigationBarItem(
              icon: _currentIndex == 1
                  ? SvgPicture.asset("assets/poll_selected.svg")
                  : SvgPicture.asset("assets/poll.svg"),
              label: labels[1],
            ),
            BottomNavigationBarItem(
              icon: _currentIndex == 2
                  ? SvgPicture.asset("assets/abacus_selected.svg")
                  : SvgPicture.asset("assets/abacus.svg"),
              label: labels[2],
            ),
            BottomNavigationBarItem(
              icon: _currentIndex == 3
                  ? SvgPicture.asset("assets/newspaper-variant_selected.svg")
                  : SvgPicture.asset("assets/newspaper-variant.svg"),
              label: labels[3],
            ),
            BottomNavigationBarItem(
              icon: _currentIndex == 4
                  ? SvgPicture.asset("assets/cogs_selected.svg")
                  : SvgPicture.asset("assets/cogs.svg"),
              label: labels[4],
            )
          ],
          selectedFontSize: 12,
          unselectedFontSize: 12,
          unselectedItemColor: AppColors.grey,
          selectedItemColor: AppColors.white,
          currentIndex: _currentIndex,
          onTap: onTap,
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.darkBlue,
        ),
      ),
      body: screens[_currentIndex],
    );
  }
}
