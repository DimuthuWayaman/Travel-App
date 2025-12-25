import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:travel_app/const/colors.dart';
import 'package:travel_app/screen/booking_screen.dart';
import 'package:travel_app/screen/home_screen.dart';
import 'package:travel_app/screen/notification_screen.dart';
import 'package:travel_app/screen/profile_screen.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int selectedIndex = 0;
  final List<Widget> _tabs = [
    const HomeScreen(),
    const NotificationScreen(),
    const BookingScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          IndexedStack(index: selectedIndex, children: _tabs),
          Align(
            alignment: Alignment.bottomCenter,
            child: CrystalNavigationBar(
              currentIndex: selectedIndex,
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              items: [
                CrystalNavigationBarItem(icon: CupertinoIcons.house_fill),
                CrystalNavigationBarItem(
                  icon: CupertinoIcons.bell_fill,
                  badge: Badge(
                    label: Text(
                      '3',
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ),
                ),
                CrystalNavigationBarItem(
                  icon: CupertinoIcons.briefcase_fill,
                ),
                CrystalNavigationBarItem(icon: CupertinoIcons.person_alt),
              ],
              backgroundColor: Colors.white.withOpacity(0.4),
              enableFloatingNavBar: true,
              indicatorColor: MyTheme.primaryColor,
              enablePaddingAnimation: true,
              selectedItemColor: MyTheme.primaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  spreadRadius: 5,
                ),
              ],
              paddingR: EdgeInsets.only(left: 8, right: 8, bottom: 1),
            ),
          ),
        ],
      ),
    );
  }
}
