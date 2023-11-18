import 'package:flutter/material.dart';
import 'package:food_app_flutter/constant.dart';
import 'package:food_app_flutter/view/index.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List _screens = const [
    HomeView(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];

  final List icons = const [
    Icons.home_outlined,
    Icons.favorite_border,
    Icons.event_note,
    Icons.settings,
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            selectedIconTheme: IconThemeData(
              color: kprimaryColor,
              size: 30,
            ),
            unselectedIconTheme: IconThemeData(
              color: Colors.grey,
              size: 30,
            ),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          type: BottomNavigationBarType.fixed,
          // backgroundColor: Colors.red,
          selectedFontSize: 13,
          unselectedFontSize: 13,
          selectedItemColor: kprimaryColor,
          unselectedItemColor: Colors.grey,
          items: icons
              .asMap()
              .map((key, value) => MapEntry(
                    key,
                    BottomNavigationBarItem(
                      label: "home",
                      icon: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Icon(value),
                      ),
                    ),
                  ))
              .values
              .toList(),
        ),
      ),
    );
  }
}
