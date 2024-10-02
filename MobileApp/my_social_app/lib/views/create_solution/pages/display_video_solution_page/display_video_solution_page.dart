import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:my_social_app/constants/routes.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/app_title.dart';
import 'package:my_social_app/views/shared/loading_view.dart';
import 'package:video_player/video_player.dart';

class DisplayVideoSolutionPage extends StatefulWidget {
  const DisplayVideoSolutionPage({super.key});

  @override
  State<DisplayVideoSolutionPage> createState() => _DisplayVideoSolutionPageState();
}

class _DisplayVideoSolutionPageState extends State<DisplayVideoSolutionPage> {
  late VideoPlayerController _controller;
  XFile? _file;
  
  void _initController(File file){
    _controller = VideoPlayerController.file(file);
    _controller
      .initialize()
      .then((_) => setState(() {}));  
  }

  void _takeVideo(){
    Navigator
      .of(context)
      .pushNamed(takeVideoRoute)
      .then((value){
        setState(() { _file = (value as XFile?);});
        if(value != null){
          _initController(File((value as XFile).path));
        }
      });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButtonWidget(),
        title: const AppTitle(
          title: "Create Video Solution"
        ),
        actions: [
          TextButton(
            onPressed: _file != null ? (){} : null,
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 4),
                  child: const Icon(Icons.done),
                ),
                const Text("Create Solution")
              ],
            )
          )
        ],
      ),
      body: Center(
        child: Builder(
          builder: (context){
            if(_file == null){
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    child: const Icon(
                      Icons.video_library_outlined,
                      size: 45,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    child: const Text(
                      "Take A Video",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 30),
                    child: const Text(
                      "Explain your solution by recording a video.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20
                      ),
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: () => _takeVideo(),
                    shape: const CircleBorder(),
                    child: const Icon(Icons.photo_camera_sharp),
                  ),
                ],
              );
            }
            return _controller.value.isInitialized
              ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    VideoPlayer(_controller),
                    const Positioned(
                      child: Icon(Icons.play_circle_filled)
                    )
                  ],
                ),
              )
              : const LoadingView();
          }
        ),
      ),
    );
  }
}