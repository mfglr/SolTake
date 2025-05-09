import 'package:app_file/app_file.dart';
import 'package:app_file_slider/app_file_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/utilities/toast_creator.dart';
import 'package:my_social_app/views/create_solution/constants.dart';
import 'package:my_social_app/views/create_solution/widgets/create_solution_button/create_solution_button.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/language_widget.dart';
import 'package:my_social_app/views/shared/take_media_speed_dial.dart';
import 'package:take_media/pages/take_media_page.dart';
import 'package:take_media_from_gallery/take_media_from_gallery.dart';
import 'add_solution_medias_page_texts.dart';

class AddSolutionMediasPage extends StatefulWidget {
  const AddSolutionMediasPage({super.key});

  @override
  State<AddSolutionMediasPage> createState() => _AddSolutionMediasPageState();
}

class _AddSolutionMediasPageState extends State<AddSolutionMediasPage> {
  Iterable<AppFile> _medias = [];

  String _getNumberExceptionContent()
    => solutionMediaNumberException[getLanguage(context)]!;

  bool _validateNumberOfMedias(){
    if(_medias.length >= maxNumberOfSolutionMedia){
      ToastCreator.displayError(_getNumberExceptionContent());
      return false;
    }
    return true;
  }

  void _takeMediaFromGallery(){
    if(_validateNumberOfMedias()){
      TakeMediaFromGalleryService()
        .getMedias()
        .then((medias) => setState(() { _medias = [..._medias, ...medias].take(maxNumberOfSolutionMedia); }));
    }
  }

  void _takeMediaFromCamera(){
    if(_validateNumberOfMedias()){
      Navigator
        .of(context)
        .push(MaterialPageRoute(builder: (context) => const TakeMediaPage()))
        .then((value){
          if(value == null) return;
          setState(() { _medias = [..._medias,value as AppFile].take(maxNumberOfSolutionMedia);});
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButtonWidget(),
        actions: [
          CreateSolutionButton(
            onPressed: () => 
              Navigator
                .of(context)
                .pop(_medias),
          )
        ],
      ),
      body: Center(
        child: Builder(
          builder: (context){
            if(_medias.isNotEmpty){
              return AppFileSlider(
                medias: _medias,
                onRemoved: (media) => setState(() => _medias = _medias.where((e) => e != media))
              );
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  child: const Row(
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
                  )
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  child: LanguageWidget(
                    child: (language) =>Text(
                      label[language]!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
                TakeMediaSpeedDial(
                  direction: SpeedDialDirection.down,
                  takeFromGallery: _takeMediaFromGallery,
                  takeFromCamera: _takeMediaFromCamera
                )
              ],
            );
          }
        ),
      ),
      floatingActionButton: _medias.isNotEmpty 
        ? TakeMediaSpeedDial(
            direction: SpeedDialDirection.left,
            takeFromGallery: _takeMediaFromGallery,
            takeFromCamera: _takeMediaFromCamera
          )
        : null,
    );
  }
}