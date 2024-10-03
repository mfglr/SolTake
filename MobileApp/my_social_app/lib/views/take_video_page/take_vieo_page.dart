import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:my_social_app/views/shared/loading_widget.dart';
import 'package:my_social_app/views/take_video_page/widgets/start_video_button.dart';
import 'package:my_social_app/views/take_video_page/widgets/stop_video_button.dart';

class TakeVieoPage extends StatefulWidget {
  final CameraDescription camera;
  const TakeVieoPage({
    super.key,
    required this.camera
  });

  @override
  State<TakeVieoPage> createState() => _TakeVieoPageState();
}

class _TakeVieoPageState extends State<TakeVieoPage> {

  late CameraController _controller;
  Future<void>? _initializeControllerFuture;
  int _duration = 0;

  @override
  void initState() {
    _controller = CameraController(widget.camera,ResolutionPreset.medium);
    _initializeControllerFuture = _controller.initialize();
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
        if(timer.tick == 30 && mounted){
          _controller
            .stopVideoRecording()
            .then((file){
              if(mounted){
                Navigator.of(context).pop(file);
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
    _controller
      .startVideoRecording()
      .then((_){ _startTimer(); });
  }

  void _onStopButtonPressed(){
    _controller
      .stopVideoRecording()
      .then((file){
        if(mounted){
          Navigator.of(context).pop(file);
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
          return Stack(
            children: [
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: CameraPreview(
                    _controller,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: const Icon(
                                  Icons.arrow_back,
                                  size: 35,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              if(_controller.value.isRecordingVideo)
                Positioned(
                  top: 30,
                  left: 30,
                  child: Text(
                    _duration.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15
                    ),
                  )
                )
            ],
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 15),
        child: _controller.value.isRecordingVideo
          ? StopVideoButton(onPressed: _onStopButtonPressed,) 
          : StartVideoButton(onPressed: _onStartButtonPressed,)
      ),
    );
  }
}