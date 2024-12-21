import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:my_social_app/utilities/toast_creator.dart';
import 'package:my_social_app/views/shared/loading_widget.dart';
import 'package:my_social_app/views/take_video_page/widgets/start_video_button.dart';
import 'package:my_social_app/views/take_video_page/widgets/stop_video_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:math' as math;

class TakeVieoPage extends StatefulWidget {
  final List<CameraDescription> cameras;
  const TakeVieoPage({
    super.key,
    required this.cameras
  });

  @override
  State<TakeVieoPage> createState() => _TakeVieoPageState();
}

class _TakeVieoPageState extends State<TakeVieoPage> {

  late CameraController _controller;
  Future<void>? _initializeControllerFuture;
  int _duration = 0;
  CameraLensDirection _direction = CameraLensDirection.back;
  double _x = 0;
  double _y = 0;
  Color _color = Colors.white;
  bool _showFocusCircle = false;

  void _focus(TapUpDetails details){
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

  void _setCamera(CameraLensDirection lensDirection){
    final cameraDescription = widget.cameras.where((e) => e.lensDirection == lensDirection).firstOrNull;
    if(cameraDescription == null){
      ToastCreator.displayError("Camera is not available!");
      return;
    }
    _controller = CameraController(cameraDescription, ResolutionPreset.max);
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

  void _startTimer(){
    Timer.periodic(
      const Duration(seconds: 1),
      (timer){
        if(timer.tick >= 120 && mounted){
          _controller
            .stopVideoRecording()
            .then((file){
              if(mounted){
                ToastCreator.displayError(AppLocalizations.of(context)!.take_video_page_duration_exception);
                Navigator.of(context).pop((file: file,direction: _direction ));
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

  void _onStartButtonPressed(){
    if(!_controller.value.isRecordingVideo){
      _controller
        .startVideoRecording()
        .then((_){ _startTimer(); });
    }
  }

  void _onStopButtonPressed(){
    _controller
      .stopVideoRecording()
      .then((file){
        if(mounted){
          Navigator.of(context).pop((file: file,direction: _direction ));
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot){
          if(snapshot.connectionState != ConnectionState.done) return const LoadingWidget();
          return Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(_direction == CameraLensDirection.front ? math.pi : 0),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    GestureDetector(
                      onTapUp: (details) => _focus(details),
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
                      )
                    ),
                    if(_controller.value.isRecordingVideo)
                      Positioned(
                        top: 30,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.6),
                            shape: BoxShape.circle
                          ),
                          child: Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.rotationY(_direction == CameraLensDirection.front ? math.pi : 0),
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Text(
                                _duration.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15
                                ),
                              ),
                            ),
                          ),
                        )
                      )
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 15),
        child: _controller.value.isRecordingVideo 
          ? StopVideoButton(onPressed: _onStopButtonPressed)
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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

                StartVideoButton(onPressed: _onStartButtonPressed),

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
      )
    );
  }
}