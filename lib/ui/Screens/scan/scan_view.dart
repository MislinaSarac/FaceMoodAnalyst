import 'package:flutter/material.dart';
import 'package:flutter_face_detection/scan_detail.dart';
import 'package:lottie/lottie.dart';

class ScanView extends StatefulWidget {
  const ScanView({super.key});

  @override
  State<ScanView> createState() => _ScanViewState();
}

class _ScanViewState extends State<ScanView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Scan',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.yellowAccent.shade700,
      ),
      body: Center(
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ScanDetail()),
            );
          },
          child: LottieBuilder.asset(
            'assets/animations/scan.json',
            width: 300,
            height: 300,
          ),
        ),
      ),
    );
  }
}
