import 'dart:async';
import 'package:app_file/app_file.dart';
import 'package:camera/camera.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:take_media/widgets.dart/camera_close_button.dart';
import 'package:take_media/widgets.dart/change_camera_button.dart';
import 'package:take_media/widgets.dart/start_video_button.dart';
import 'package:take_media/widgets.dart/stop_video_button.dart';
import 'package:take_media/widgets.dart/take_photo_button.dart';
import 'package:take_media/widgets.dart/video_duration_displayer.dart';

class TakeMediaPage extends StatefulWidget {
  final List<CameraDescription> cameras;
  const TakeMediaPage({
    super.key,
    required this.cameras
  });

  @override
  State<TakeMediaPage> createState() => _TakeMediaPageState();
}

class _TakeMediaPageState extends State<TakeMediaPage> {
  late CameraController _controller;
  bool _videoState = false;
  int _duration = 0;
  late bool _isCameraDirectionChangeable;
  late CameraLensDirection _direction;
  
  void _changeCameraDirection(){
    _direction = _direction == CameraLensDirection.back ? CameraLensDirection.front : CameraLensDirection.back;
    final cameraDescription = widget.cameras.where((e) => e.lensDirection == _direction).first;
    _controller.setDescription(cameraDescription).then((_) => setState((){}));
  }

  void _takePhoto() =>
    _controller
        .takePicture()
        .then((image){ if(mounted) Navigator.of(context).pop(AppFile.image(image)); });

  void _startVideoRecording() =>
    _controller
        .startVideoRecording()
        .then((_) => setState(_startTimer));
    
  void _stopVideoRecording() =>
    _controller
        .stopVideoRecording()
        .then((video){ if(mounted) Navigator.of(context).pop(AppFile.video(video)); });

  void _startTimer(){
    Timer.periodic(
      const Duration(seconds: 1),
      (timer){
        if(timer.tick >= 300 && mounted){
          _controller
            .stopVideoRecording()
            .then((file){
              if(mounted){
                Navigator.of(context).pop(AppFile.video(file));
              }
            });
          timer.cancel();
        }
        else{
          if(mounted){
            setState(() { _duration = timer.tick; });
          }
        }
      } 
    );
  }

  Widget _getFloatActionButton(){
    if(!_videoState) return TakePhotoButton(onPressed: _takePhoto);
    if(!_controller.value.isRecordingVideo) return StartVideoButton(onPressed: _startVideoRecording);
    return StopVideoButton(onPressed: _stopVideoRecording);
  }

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
        ? Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Stack(
                alignment: AlignmentDirectional.centerStart,
                children: [
                  Center(
                    child: AspectRatio(
                      aspectRatio: 1 / _controller.value.aspectRatio,
                      child: RotatedBox(
                        quarterTurns: _direction == CameraLensDirection.back ? -1 : 1,
                        child: CameraPreview(_controller),
                      ),
                    )
                  ),
                  if(!_controller.value.isRecordingVideo) 
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _videoState ? Colors.black.withAlpha(153) : Colors.blue
                          ),
                          margin: const EdgeInsets.all(5),
                          child: IconButton(
                            onPressed: () => setState(() => _videoState = false ),
                            icon: const Icon(
                              Icons.photo_camera,
                              color: Colors.white,
                            )
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: !_videoState ? Colors.black.withAlpha(153) : Colors.blue
                          ),
                          margin: const EdgeInsets.all(5),
                          child: IconButton(
                            onPressed: () => setState(() => _videoState = true ),
                            icon: const Icon(
                              Icons.video_camera_back,
                              color: Colors.white,
                            )
                          ),
                        )
                      ],
                    )
                ],
              ),
              if(_controller.value.isRecordingVideo)
                Container(
                  margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 16),
                  child: VideoDurationDisplayer(duration: _duration)
                )
            ],
          )
        : const Center(child: CircularProgressIndicator()),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          if(!_controller.value.isRecordingVideo)
            const CameraCloseButton(),
          _getFloatActionButton(),
          if(!_controller.value.isRecordingVideo && _isCameraDirectionChangeable)
            ChangeCameraButton(onPressed: _changeCameraDirection,)
        ],
      )
    );
  }
}