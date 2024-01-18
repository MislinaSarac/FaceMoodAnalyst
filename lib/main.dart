import 'package:flutter/material.dart';
import 'package:flutter_face_detection/scan_detail.dart';
import 'package:flutter_face_detection/ui/Screens/Calender/calender_view.dart';
import 'package:flutter_face_detection/ui/Screens/home/navbar.dart';
import 'package:flutter_face_detection/ui/Screens/splash/splash_view.dart';
import 'package:flutter_face_detection/ui/screens/login/login_view.dart';

import 'ui/Screens/home/ornek.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Splash Screen',
      debugShowCheckedModeBanner: false,
      home: Registerornek(),
    );
  }
}
