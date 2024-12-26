import 'dart:async';
import 'package:app_file/app_file.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:take_media/exceptions/camera_not_available_exception.dart';
import 'package:take_media/widgets.dart/camera_close_button.dart';
import 'package:take_media/widgets.dart/change_camera_button.dart';
import 'package:take_media/widgets.dart/take_photo_button.dart';

class TakeImagePage extends StatefulWidget {
  final List<CameraDescription> cameras;
  const TakeImagePage({
    super.key,
    required this.cameras
  });

  @override
  State<TakeImagePage> createState() => _TakeImagePageState();
}

class _TakeImagePageState extends State<TakeImagePage> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  CameraLensDirection _direction = CameraLensDirection.back;
  late bool _isCameraDirectionChangeable;
  
  void _setCamera(CameraLensDirection lensDirection){
    final cameraDescription = widget.cameras.where((e) => e.lensDirection == lensDirection).firstOrNull;
    if(cameraDescription == null){
      throw CameraNotAvailableException();
    }
    _controller.dispose();
    _controller = CameraController(cameraDescription, ResolutionPreset.max);
    _initializeControllerFuture = _controller.initialize();
    setState(() {});
  }

  void _changeCameraDirection(){
    _direction = _direction == CameraLensDirection.back ? CameraLensDirection.front : CameraLensDirection.back;
    _setCamera(_direction);
  }

  void _takePhoto() =>
    _controller
        .takePicture()
        .then((image){ if(mounted) Navigator.of(context).pop(AppFile.image(image)); });

  @override
  void initState() {
    _isCameraDirectionChangeable = 
      ![CameraLensDirection.back,CameraLensDirection.front]
        .any((cld) => !widget.cameras.any((cm) => cld == cm.lensDirection));
    
    _controller = CameraController(widget.cameras.first, ResolutionPreset.max);
    _initializeControllerFuture = _controller.initialize();
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
        builder: (context,snapshot) => 
          snapshot.connectionState == ConnectionState.done
            ? Center(child: CameraPreview(_controller))
            : const Center(child: CircularProgressIndicator())
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const CameraCloseButton(),
          TakePhotoButton(onPressed: _takePhoto),
          if(_isCameraDirectionChangeable)
            ChangeCameraButton(onPressed: _changeCameraDirection,)
        ],
      )
    );
  }
}