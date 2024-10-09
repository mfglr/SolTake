import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:my_social_app/constants/routes.dart';
import 'package:my_social_app/utilities/toast_creator.dart';
import 'package:my_social_app/views/create_solution/pages/add_solution_content_page/add_solution_content_page.dart';
import 'package:my_social_app/views/create_solution/pages/create_video_solution_page/widgets/solution_creation_video_player.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/app_title.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CreateVideoSolutionPage extends StatefulWidget {
  const CreateVideoSolutionPage({super.key});

  @override
  State<CreateVideoSolutionPage> createState() => _DisplayVideoSolutionPageState();
}

class _DisplayVideoSolutionPageState extends State<CreateVideoSolutionPage> {
  VideoPlayerController? _controller;
  XFile? _video;
  
  void _initController(File file){
    _controller = VideoPlayerController.file(file);
    _controller!
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
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButtonWidget(),
        title: AppTitle(
          title: AppLocalizations.of(context)!.create_video_solution_page_title
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
                Text(AppLocalizations.of(context)!.create_video_solution_page_new_video_content)
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
                    child: Text(
                      AppLocalizations.of(context)!.create_video_solution_page_content1,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 30),
                    child: Text(
                      AppLocalizations.of(context)!.create_video_solution_page_content2,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
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
              controller: _controller!,
              onDeleted: () => setState(() { _video = null; }),
              play: (){
                _controller!
                  .play()
                  .then((_){ setState((){}); });
              },
              pause: (){
                _controller!
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
              ToastCreator.displayError(AppLocalizations.of(context)!.create_video_solution_page_no_video_error);
              return;
            }
            _controller?.pause();
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
          child: Text(AppLocalizations.of(context)!.create_video_solution_page_contiune_button_content) 
        ),
      ),
    );
  }
}