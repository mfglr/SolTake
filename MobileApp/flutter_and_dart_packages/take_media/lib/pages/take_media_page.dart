import 'dart:async';
import 'package:app_file/app_file.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:take_media/exceptions/camera_not_available_exception.dart';
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
  late Future<void> _initializeControllerFuture;
  bool _videoState = false;
  int _duration = 0;
 
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

  CameraLensDirection _direction = CameraLensDirection.back;
  void _changeCameraDirection(){
    _direction = _direction == CameraLensDirection.back ? CameraLensDirection.front : CameraLensDirection.back;
    _setCamera(_direction);
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
            ? Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  Center(
                    child: CameraPreview(
                      _controller,
                      child:
                        !_controller.value.isRecordingVideo 
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
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
                          : null
                    )
                  ),
                  if(_controller.value.isRecordingVideo)
                    Container(
                      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 16),
                      child: VideoDurationDisplayer(duration: _duration)
                    )
                ],
              )
            : const Center(child: CircularProgressIndicator())
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          if(!_controller.value.isRecordingVideo)
            const CameraCloseButton(),
          _getFloatActionButton(),
          if(!_controller.value.isRecordingVideo)
            ChangeCameraButton(onPressed: _changeCameraDirection,)
        ],
      )
    );
  }
}