import 'package:app_file/app_file.dart';
import 'package:app_file_slider/app_file_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:my_social_app/constants/routes.dart';
import 'package:my_social_app/views/create_question/widgets/create_question_button.dart';
import 'package:my_social_app/views/shared/take_media_speed_dial.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:take_media_from_gallery/take_media_from_gallery.dart';

class AddQuestionMediasPage extends StatefulWidget {
  const AddQuestionMediasPage({super.key});

  @override
  State<AddQuestionMediasPage> createState() => _AddQuestionMediasPageState();
}

class _AddQuestionMediasPageState extends State<AddQuestionMediasPage> {
  Iterable<AppFile> _medias = [];

  void _takeFromGallery(){
    TakeMediaFromGalleryService()
      .getMedias()
      .then((medias) => setState(() => _medias = [..._medias, ...medias]));
  }

  void _takeFromCamera(){
    Navigator
      .of(context)
      .pushNamed(takeMediaRoute)
      .then((media) => setState((){
        if(media != null){
          _medias = [..._medias, media as AppFile];
        }
      }));
  }

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButtonWidget(),
        actions: [
          CreateQuestionButton(onPressed: () => Navigator.of(context).pop(_medias))
        ],
      ),
      body: Stack(
        children: [
          Builder(
            builder: (context){
              if(_medias.isNotEmpty){
                return AppFileSlider(
                  medias: _medias,
                  onRemoved: (media) => setState(() => _medias = _medias.where((e) => e != media)) 
                );
              }
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.videocam_outlined,
                            size: 75,
                          ),
                          Icon(
                            Icons.image_outlined,
                            size: 75,
                          ),
                          Icon(
                            Icons.spatial_audio_off_outlined,
                            size: 75,
                          ),
                        ],
                      ),
                      Text(
                        AppLocalizations.of(context)!.add_question_medias_page_label,
                        textAlign: TextAlign.center,
                        style: const TextStyle( fontSize: 20),
                      ),
                      TakeMediaSpeedDial(
                        direction: SpeedDialDirection.down,
                        takeFromGallery: _takeFromGallery,
                        takeFromCamera: _takeFromCamera
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButtonLocation: _medias.isNotEmpty ? FloatingActionButtonLocation.endFloat : null,
      floatingActionButton: _medias.isNotEmpty 
        ? TakeMediaSpeedDial(
            direction: SpeedDialDirection.left,
            takeFromGallery: _takeFromGallery,
            takeFromCamera: _takeFromCamera
          )
        : null,
    );
  }
}