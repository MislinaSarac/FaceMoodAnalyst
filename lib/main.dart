import 'package:flutter/material.dart';
import 'package:flutter_face_detection/home_view.dart';
import 'package:flutter_face_detection/ui/screens/login/login_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
