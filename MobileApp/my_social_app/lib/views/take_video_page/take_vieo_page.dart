import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:my_social_app/views/shared/loading_widget.dart';
import 'package:my_social_app/views/take_video_page/start_video_button.dart';
import 'package:my_social_app/views/take_video_page/stop_video_button.dart';

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
  late Future<void> _initializeControllerFuture;
  bool _isRecording = false;

  @override
  void initState() {
    _controller = CameraController(widget.camera,ResolutionPreset.max);
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
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot){
          if(snapshot.connectionState != ConnectionState.done) return const LoadingWidget();
          return Center(
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
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 15),
        child: FloatingActionButton(
          shape: const CircleBorder(),
          child: _isRecording ? const StopVideoButton() : const StartVideoButton(),
          onPressed: () {
            if(_isRecording){
              _initializeControllerFuture
                .then((_){
                  setState(() { _isRecording = false; });
                  _controller
                    .stopVideoRecording()
                    .then((video) => Navigator.of(context).pop(video));
                });
            }else{
              _initializeControllerFuture
              .then((_){
                setState(() { _isRecording = true; });
                _controller.startVideoRecording();
              });
            }
          },
        ),
      ),
    );
  }
}