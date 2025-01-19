import 'package:app_file/app_file.dart';
import 'package:camera/camera.dart';
import 'package:collection/collection.dart';
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
  late CameraLensDirection _direction;
  late CameraDescription _description;
  late bool _isCameraDirectionChangeable;
  double _x = 0;
  double _y = 0;
  Color _color = Colors.white;
  bool _showFocusCircle = false;

  void _focus(TapDownDetails details){

    double fullWidth = MediaQuery.of(context).size.width;
    double cameraHeight = fullWidth * _controller.value.aspectRatio;
    
    setState(() {
      _x = details.localPosition.dx;
      _y = details.localPosition.dy;
      _showFocusCircle = true;
      _color = Colors.white;
    });
    
    _controller
      .setFocusPoint(Offset(_x / fullWidth, _y / cameraHeight))
      .then((_){
        setState(() { _color = Colors.yellow; });
        Future
          .delayed(const Duration(milliseconds: 300))
          .then((_){
            if(mounted){
              setState(() { _showFocusCircle = false; });
            }
          });
      })
      .catchError((_){
        if(mounted){
          setState(() { _showFocusCircle = false; });
        }
      });
  }


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

    var description =
      widget.cameras.firstWhereOrNull((e) => e.lensDirection == CameraLensDirection.back) ??
      widget.cameras.firstWhereOrNull((e) => e.lensDirection == CameraLensDirection.front) ??
      widget.cameras.first;

    _direction = description.lensDirection;

    _controller = CameraController(description, ResolutionPreset.max);
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
          child: GestureDetector(
            onTapDown: _focus,
            child: Stack(
              children: [
                CameraPreview(_controller),
                if(_showFocusCircle)
                  Positioned(
                    top: _y - 30,
                    left: _x - 30,
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: _color,
                          width: 1.5
                        )
                      ),
                    )
                  )
              ],
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