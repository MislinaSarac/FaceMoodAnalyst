import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.white,
          color: Colors.yellowAccent.shade700,
          animationDuration: const Duration(milliseconds: 300),
          onTap: (index) {
            int _currentIndex = 0;
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
