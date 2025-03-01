import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class Mybottombar extends StatefulWidget {
  const Mybottombar({super.key});

  @override
  State<Mybottombar> createState() => _MybottombarState();
}

class _MybottombarState extends State<Mybottombar> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar(
  notchSmoothness: NotchSmoothness.defaultEdge,
  scaleFactor: 0.8, // Recommended range is 0.5 to 1.0
  safeAreaValues: SafeAreaValues(left: true, right: true, top: false, bottom: true),
  backgroundColor: const Color.fromARGB(255, 32, 32, 32),
  activeColor: Colors.white,
  inactiveColor: Colors.blue.shade100,
  iconSize: 25.0,
  gapWidth: 5.0,
  gapLocation: GapLocation.end,
  icons: [
    Icons.person,
    Icons.home,
    Icons.add,
    Icons.calendar_today,
    Icons.settings,
  ],
  activeIndex: 0,
  onTap: (index) {
    print("Tapped on index: $index");
  },
);

  }
}