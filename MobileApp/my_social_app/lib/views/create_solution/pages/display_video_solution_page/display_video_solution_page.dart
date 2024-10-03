import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:my_social_app/constants/routes.dart';
import 'package:my_social_app/utilities/toast_creator.dart';
import 'package:my_social_app/views/create_solution/pages/add_solution_content_page/add_solution_content_page.dart';
import 'package:my_social_app/views/create_solution/pages/display_video_solution_page/widgets/solution_creation_video_player.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/app_title.dart';
import 'package:video_player/video_player.dart';

class DisplayVideoSolutionPage extends StatefulWidget {
  const DisplayVideoSolutionPage({super.key});

  @override
  State<DisplayVideoSolutionPage> createState() => _DisplayVideoSolutionPageState();
}

class _DisplayVideoSolutionPageState extends State<DisplayVideoSolutionPage> {
  late VideoPlayerController _controller;
  XFile? _video;
  
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
        setState(() { _video = (value as XFile?);});
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
            onPressed: _takeVideo,
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 4),
                  child: const Icon(Icons.photo_camera_sharp),
                ),
                const Text("New Video")
              ],
            )
          )
        ],
      ),
      body: Center(
        child: Builder(
          builder: (context){
            if(_video == null){
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
            return SolutionCreationVideoPlayer(
              controller: _controller,
              onDeleted: () => setState(() { _video = null; }),
              play: (){
                _controller
                  .play()
                  .then((_){ setState((){}); });
              },
              pause: (){
                _controller
                  .pause()
                  .then((_){ setState((){}); });
              }
            );
          }
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: OutlinedButton(
          onPressed: (){
            if(_video == null){
              ToastCreator.displayError("You have to upload a video");
              return;
            }
            Navigator
              .of(context)
              .push(MaterialPageRoute(builder: (context) => AddSolutionContentPage(multiMedya: [_video!])))
              .then((value){
                if(value == null) return;
                if(context.mounted){
                  Navigator.of(context).pop((content: value, video: _video));
                }
              });
          },
          child: const Text("Contuinue") 
        ),
      ),
    );
  }
}