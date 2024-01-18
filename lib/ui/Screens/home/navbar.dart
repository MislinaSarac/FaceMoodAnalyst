import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_face_detection/ui/Screens/Calender/calender_view.dart';
import 'package:flutter_face_detection/ui/Screens/home/home_view.dart';
import 'package:flutter_face_detection/ui/Screens/profile/profile_view.dart';
import 'package:flutter_face_detection/ui/Screens/scan/scan_view.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeView(),
    const ScanView(),
    const CalenderView(),
    const ProfileView()
    // Page3(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.white,
          color: Colors.yellowAccent.shade700,
          animationDuration: const Duration(milliseconds: 300),
          index: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            Icon(Icons.home, color: Colors.white),
            Icon(Icons.camera_enhance_rounded, color: Colors.white),
            Icon(Icons.calendar_month_rounded, color: Colors.white),
            Icon(Icons.person_3, color: Colors.white),
          ]),
    );
  }
}
