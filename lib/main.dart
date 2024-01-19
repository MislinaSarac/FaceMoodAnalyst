import 'package:flutter/material.dart';
import 'package:flutter_face_detection/ui/Screens/splash/splash_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Splash Screen',
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}
