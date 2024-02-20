import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';

class CameraView extends StatefulWidget {
  const CameraView({super.key, required this.camera});
  final CameraDescription camera;
  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  late final CameraController _controller;
  String _label = 'Result';
  double _result = 0;
  bool _available = true;

  @override
  void initState() {
    super.initState();
    _allMethods();
  }

  Future<void> _allMethods() async {
    await _modelInitialize();
    _controllerInitialize();
  }

  Future<void> _modelInitialize() async {
    try {
      const modelPath = 'assets/tflite/tflite_model.tflite';
      const labelPath = 'assets/tflite/labels.txt';
      final x = await Tflite.loadModel(model: modelPath, labels: labelPath);
      print('x : $x');
    } catch (e) {
      print('Error in loading tflite model : $e');
    }
  }

  Future<void> _controllerInitialize() async {
    _controller = CameraController(widget.camera, ResolutionPreset.max);
    await _controller.initialize();
    _controller.startImageStream((img) async {
      if (_available) {
        _available = false;
        final List<dynamic>? recognitions = await Tflite.runModelOnFrame(
          bytesList: img.planes.map((plane) => plane.bytes).toList(),
          imageHeight: img.height,
          imageWidth: img.width,
          numResults: 3, // label sayısı
          threshold: 0.5,
          imageMean: 127.5,
          imageStd: 127.5,
        );
        if (recognitions != null && recognitions.isNotEmpty) {
          _label = recognitions[0]['label'];
          _result = recognitions[0]['confidence'];
          setState(() {});
        }

        await Future.delayed(const Duration(seconds: 2));
        _available = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
        future: _allMethods(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              children: [
                CameraPreview(_controller),
                const Spacer(),
                Text(
                  '${_label.toUpperCase()} : %${(_result * 100).toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const Spacer(),
              ],
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
