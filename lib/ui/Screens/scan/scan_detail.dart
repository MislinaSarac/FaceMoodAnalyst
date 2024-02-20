import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_face_detection/ui/Screens/scan/camera_view.dart';

class ScanDetail extends StatefulWidget {
  const ScanDetail({super.key});

  @override
  State<ScanDetail> createState() => _ScanDetailState();
}

class _ScanDetailState extends State<ScanDetail> {
  Future<CameraDescription> _getCameras() async {
    final List<CameraDescription> cameras = await availableCameras();
    return cameras[1];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
