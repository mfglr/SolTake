import 'package:app_file/app_file.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
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
  CameraLensDirection _direction = CameraLensDirection.back;
  late CameraDescription _description;
  late bool _isCameraDirectionChangeable;

  void _changeCameraDirection(){
    _direction = _direction == CameraLensDirection.back ? CameraLensDirection.front : CameraLensDirection.back;
    _description = widget.cameras.where((e) => e.lensDirection == _direction).first;
    _controller.setDescription(_description).then((_) => setState(() {}));
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
    
    _description = widget.cameras.where((e) => e.lensDirection == _direction).first;

    _controller = CameraController(widget.cameras.first, ResolutionPreset.max);
    _controller.initialize().then((_) => setState((){}));
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
      body: _controller.value.isInitialized
        ? Center(
            child: AspectRatio(
              aspectRatio: 1 / _controller.value.aspectRatio,
              child: RotatedBox(
                  quarterTurns: _direction == CameraLensDirection.back ? -1 : 1,
                  child: _controller.buildPreview(),
                ),
            ),
          )
        : const Center(child: CircularProgressIndicator()),
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