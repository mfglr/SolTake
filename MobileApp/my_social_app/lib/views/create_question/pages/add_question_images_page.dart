import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_social_app/constants/routes.dart';
import 'package:my_social_app/models/app_file.dart';
import 'package:my_social_app/utilities/toast_creator.dart';
import 'package:my_social_app/views/create_question/widgets/take_media_speed_dial.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_social_app/views/shared/app_image_slider/app_image_slider.dart';

class AddQuestionImagesPage extends StatefulWidget {
  const AddQuestionImagesPage({super.key});

  @override
  State<AddQuestionImagesPage> createState() => _AddQuestionImagesPageState();
}

class _AddQuestionImagesPageState extends State<AddQuestionImagesPage> {
  Iterable<AppFile> _images = [];

  void _takeImageFromCamera(){
    if(_images.length >= 3){
      ToastCreator.displayError(AppLocalizations.of(context)!.add_question_images_page_error_message);
      return;
    }
    Navigator
      .of(context)
      .pushNamed(takeImageRoute)
      .then((image){
        if(image != null){
          setState(() { _images = [..._images, AppFile.image(image as XFile)]; });
        }
      });
  }

  void _takeImagesFromGallery(){
    if(_images.length >= 3){
      ToastCreator.displayError(AppLocalizations.of(context)!.add_question_images_page_error_message);
      return;
    }
    ImagePicker()
      .pickMultiImage(imageQuality: 100)
      .then((images){
        if(images.length + _images.length > 3){
          if(mounted){
            ToastCreator.displayError(AppLocalizations.of(context)!.add_question_images_page_error_message);
            final count = 3 - _images.length;
            final newImages = images.whereIndexed((i,e) => i < count);
            setState(() { _images = [..._images,...newImages.map((e) => AppFile.image(e))]; });
          }
        }
        else{
          setState(() { _images = [..._images,...images.map((e) => AppFile.image(e))]; });
        }
      });
  }

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButtonWidget(),
        title: Text(AppLocalizations.of(context)!.add_question_images_page_title),
      ),
      body: Builder(
        builder: (context){
          if(_images.isNotEmpty){
            return AppImageSlider(
              images: _images,
              removeImage: (image) => setState(() { _images = _images.where((e) => e != image); }),
            );
          }
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.photo_outlined,
                    size: 75,
                  ),
                  Text(
                    AppLocalizations.of(context)!.add_question_image_page_label,
                    textAlign: TextAlign.center,
                    style: const TextStyle( fontSize: 20),
                  ),
                  TakeMediaSpeedDial(
                    direction: SpeedDialDirection.down,
                    takeFromGallery: _takeImagesFromGallery,
                    takeFromCamera: _takeImageFromCamera,
                  )
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButtonLocation: _images.isNotEmpty ? FloatingActionButtonLocation.endFloat : null,
      floatingActionButton: _images.isNotEmpty 
        ? TakeMediaSpeedDial(
            direction: SpeedDialDirection.left,
            takeFromGallery: _takeImagesFromGallery,
            takeFromCamera: _takeImageFromCamera,
          )
        : null,
      bottomNavigationBar: Padding(
        padding: const  EdgeInsets.all(15),
        child: OutlinedButton(
          onPressed: () => Navigator.of(context).pop(_images),
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