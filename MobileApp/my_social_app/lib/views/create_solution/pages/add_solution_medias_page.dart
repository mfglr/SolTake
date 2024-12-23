import 'package:app_file/app_file.dart';
import 'package:app_file_slider/app_file_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:my_social_app/constants/routes.dart';
import 'package:my_social_app/views/create_solution/widgets/create_solution_button.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/take_media_speed_dial.dart';
import 'package:take_media_from_gallery/take_media_from_gallery.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddSolutionMediasPage extends StatefulWidget {
  const AddSolutionMediasPage({super.key});

  @override
  State<AddSolutionMediasPage> createState() => _AddSolutionMediasPageState();
}

class _AddSolutionMediasPageState extends State<AddSolutionMediasPage> {
  Iterable<AppFile> _medias = [];

  void _takeMediaFromGallery(){
    TakeMediaFromGalleryService()
      .getMedias()
      .then((medias) => setState(() { _medias = [..._medias, ...medias]; }));
  }

  void _takeMediaFromCamera(){
    Navigator
      .of(context)
      .pushNamed(takeMediaRoute)
      .then((value){
        if(value == null) return;
        setState(() { _medias = [..._medias,value as AppFile];});
      });
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
            if(_medias.isNotEmpty) return AppFileSlider(medias: _medias);
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: OutlinedButton(
          onPressed: (){
            Navigator
              .of(context)
              .pop(_medias);
          },
          child: Text(AppLocalizations.of(context)!.create_video_solution_page_contiune_button_content) 
        ),
      ),
    );
  }
}