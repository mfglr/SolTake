import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_social_app/constants/routes.dart';
import 'package:my_social_app/models/app_file.dart';
import 'package:my_social_app/views/create_question/widgets/take_media_speed_dial.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:video_player/video_player.dart';

class AddQuestionVideoPage extends StatefulWidget {
  const AddQuestionVideoPage({super.key});

  @override
  State<AddQuestionVideoPage> createState() => _AddQuestionVideoPageState();
}

class _AddQuestionVideoPageState extends State<AddQuestionVideoPage> {
  AppFile? _video;
  VideoPlayerController? _controller;

  void _takeVideoFromGallery(){
    ImagePicker()
      .pickVideo(source: ImageSource.gallery)
      .then((video){
        if(video != null){
          _video = AppFile.video(video);
          _controller = VideoPlayerController.file(File(video.path));
          _controller!.initialize().then((_) => setState(() {}));
        }
      });
  }

  void _takeVideoFromCamera(){
    Navigator
      .of(context)
      .pushNamed(takeVideoRoute)
      .then((value) => setState((){
        if(value != null){
          _video = AppFile.video((value as dynamic).file);
          _controller = VideoPlayerController.file(File(_video!.file.path));
          _controller!.initialize().then((_) => setState(() {}));
        }
      }));
  }

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButtonWidget(),
        title: Text(AppLocalizations.of(context)!.add_question_video_page_title),
      ),
      body: Builder(
        builder: (context){
          if(_video != null){
            return Stack(
              children: [
                VideoPlayer(_controller!),
                Positioned(
                  top: 15,
                  right: 15,
                  child: IconButton(
                    onPressed: () => setState(() => _video = null),
                    icon: const Icon(Icons.close)
                  )
                )
              ],
            );
          }
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.video_library_outlined,
                    size: 75,
                  ),
                  Text(
                    AppLocalizations.of(context)!.add_question_video_page_label,
                    textAlign: TextAlign.center,
                    style: const TextStyle( fontSize: 20),
                  ),
                  TakeMediaSpeedDial(
                    direction: SpeedDialDirection.down,
                    takeFromGallery: _takeVideoFromGallery,
                    takeFromCamera: _takeVideoFromCamera
                  )
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButtonLocation: _video != null ? FloatingActionButtonLocation.endFloat : null,
      floatingActionButton: _video != null 
        ? TakeMediaSpeedDial(
            direction: SpeedDialDirection.left,
            takeFromGallery: _takeVideoFromGallery,
            takeFromCamera: _takeVideoFromCamera
          )
        : null,
      bottomNavigationBar: Padding(
        padding: const  EdgeInsets.all(15),
        child: OutlinedButton(
          onPressed: () => Navigator.of(context).pop(_video != null ? [_video!].take(1) : null),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 4),
                child: Text(AppLocalizations.of(context)!.add_question_image_page_create_question_button),
              ),
              const Icon(Icons.create)
            ],
          ),
        ),
      ),
    );
  }
}