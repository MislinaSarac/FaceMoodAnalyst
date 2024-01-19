import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_face_detection/ui/screens/login/login_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    // Add a delay using Future.delayed
    Timer(
      Duration(seconds: 3), // Change the duration as per your requirement
      () {
        // Navigate to the login page after the delay
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginView()),
        );
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/dashboard.png',
              width: 700,
              height: 700,
            ),
            const Text(
              'EmojiGooo!',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: const Color.fromARGB(255, 243, 207, 28)),
            ),
            Text(
              'Discover the perfect emoji for every situation',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 15,
              ),
            )
          ],
        ),
      ),
    );
  }
}
