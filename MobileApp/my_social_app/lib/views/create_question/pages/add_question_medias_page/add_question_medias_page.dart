import 'package:app_file/app_file.dart';
import 'package:app_file_slider/app_file_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/utilities/toast_creator.dart';
import 'package:my_social_app/views/create_question/constants.dart';
import 'package:my_social_app/views/create_question/widgets/create_question_button/create_question_button.dart';
import 'package:my_social_app/views/shared/language_widget.dart';
import 'package:my_social_app/views/shared/take_media_speed_dial.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:take_media/pages/take_media_page.dart';
import 'package:take_media_from_gallery/take_media_from_gallery.dart';
import 'add_question_medias_page_texts.dart';

class AddQuestionMediasPage extends StatefulWidget {
  const AddQuestionMediasPage({super.key});

  @override
  State<AddQuestionMediasPage> createState() => _AddQuestionMediasPageState();
}

class _AddQuestionMediasPageState extends State<AddQuestionMediasPage> {
  Iterable<AppFile> _medias = [];

  String _getNumberExceptionContent() => questionMediaNumberException[getLanguage(context)]!;

  bool _validateNumberOfMedias(){
    if(_medias.length >= numberOfMaxQuestionMedias){
      ToastCreator.displayError(_getNumberExceptionContent());
      return false;
    }
    return true;
  }

  void _takeFromGallery(){
    if(_validateNumberOfMedias()){
      TakeMediaFromGalleryService()
        .getMedias()
        .then((medias) => setState(() => _medias = [..._medias, ...medias].take(numberOfMaxQuestionMedias)));
    }
  }

  void _takeFromCamera(){
    if(_validateNumberOfMedias()){
      Navigator
        .of(context)
        .push(MaterialPageRoute(builder: (context) => const TakeMediaPage()))
        .then((media) => setState((){
          if(media != null){
            _medias = [..._medias, media as AppFile].take(numberOfMaxQuestionMedias);
          }
        }));
    }
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
                      LanguageWidget(
                        child: (language) =>Text(
                          label[language]!,
                          textAlign: TextAlign.center,
                          style: const TextStyle( fontSize: 20),
                        ),
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