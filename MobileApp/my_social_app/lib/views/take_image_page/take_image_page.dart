import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:my_social_app/utilities/toast_creator.dart';
import 'dart:math' as math;

class TakeImagePage extends StatefulWidget {
  final List<CameraDescription> cameras;
  const TakeImagePage({super.key,required this.cameras});

  @override
  State<TakeImagePage> createState() => _TakeImagePageState();
}

class _TakeImagePageState extends State<TakeImagePage> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  CameraLensDirection _direction = CameraLensDirection.back;

  void _setCamera(CameraLensDirection lensDirection){
    final cameraDescription = widget.cameras.where((e) => e.lensDirection == lensDirection).firstOrNull;
    if(cameraDescription == null){
      ToastCreator.displayError("Camera is not available!");
      return;
    }
    _controller = CameraController(cameraDescription, ResolutionPreset.medium);
    _initializeControllerFuture = _controller.initialize();
    setState(() {});
  }

  _changeCameraDirection(){
    _direction = _direction == CameraLensDirection.back ? CameraLensDirection.front : CameraLensDirection.back;
    _setCamera(_direction);
  }

  @override
  void initState() {
    _setCamera(_direction);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context,snapshot){
          if (snapshot.connectionState == ConnectionState.done) {
            return Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(_direction == CameraLensDirection.front ? math.pi : 0),
                  child: CameraPreview(_controller),
                ),
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        }
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black.withOpacity(0.6),
              ),
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(
                  Icons.close_outlined,
                  size: 25,
                  color: Colors.white,
                ),
              ),
            ),

            FloatingActionButton(
              shape: const CircleBorder(),
              child: const Icon(Icons.photo_camera),
              onPressed: () async {
                await _initializeControllerFuture;
                final image = await _controller.takePicture();
                if (!context.mounted) return;
                return Navigator.of(context).pop(image);
              },
            ),

            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black.withOpacity(0.6),
              ),
              child: IconButton(
                onPressed: () => _changeCameraDirection(),
                icon: const Icon(
                  Icons.change_circle_outlined,
                  color: Colors.white,
                  size: 25,
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}