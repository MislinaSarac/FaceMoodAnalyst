import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_face_detection/camera_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Future<CameraDescription> _getCameras() async {
    final List<CameraDescription> cameras = await availableCameras();
    return cameras[1];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<CameraDescription>(
        future: _getCameras(),
        builder:
            (BuildContext context, AsyncSnapshot<CameraDescription> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Center(
              child: ElevatedButton(
                onPressed: () async {
                  final CameraDescription? camera = snapshot.data;
                  if (camera == null) return;

                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CameraView(camera: camera),
                    ),
                  );
                },
                child: const Text('Navigate to Camera'),
              ),
            );
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
