import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_social_app/constants/routes.dart';
import 'package:my_social_app/utilities/toast_creator.dart';
import 'package:my_social_app/views/create_solution/pages/add_solution_content_page/add_solution_content_page.dart';
import 'package:my_social_app/views/create_solution/pages/add_solution_images_page/widgets/no_solution_image_widget.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_social_app/views/shared/app_image_slider/app_image_slider.dart';
import 'package:my_social_app/views/shared/app_title.dart';
import 'package:my_social_app/views/shared/take_multimedya_speed_dial/take_multimedya_speed_dial.dart';

class AddSolutionImagesPage extends StatefulWidget {
  const AddSolutionImagesPage({super.key});
  @override
  State<AddSolutionImagesPage> createState() => _AddSolutionImagesPageState();
}

class _AddSolutionImagesPageState extends State<AddSolutionImagesPage> {
  Iterable<XFile> _images = [];

  void _takeImage(){
    if(_images.length >= 3){
      ToastCreator.displayError(AppLocalizations.of(context)!.add_solution_images_page_error);
      return;
    }
    Navigator
      .of(context)
      .pushNamed(takeImageRoute)
      .then((image){
        if(image != null){
          setState(() { _images = [..._images,image as XFile]; });
        }
      });
  }

  void _takeImages(){
    if(_images.length >= 3){
      ToastCreator.displayError(AppLocalizations.of(context)!.add_solution_images_page_error);
      return;
    }

    ImagePicker()
      .pickMultiImage(imageQuality: 100)
      .then((images){
        if(images.length + _images.length > 3){
          if(mounted){
            ToastCreator.displayError(AppLocalizations.of(context)!.add_solution_images_page_error);
            final count = 3 - _images.length;
            final newImages = images.whereIndexed((i,e) => i < count);
            setState(() { _images = [..._images,...newImages]; });
          }
        }
        else{
          setState(() { _images = [..._images,...images]; });
        }
      });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButtonWidget(),
        title: AppTitle(
          title: AppLocalizations.of(context)!.add_solution_images_page_title,
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8),
        child: OutlinedButton(
          onPressed: () => 
            Navigator
              .of(context)
              .push(MaterialPageRoute(builder: (context) => AddSolutionContentPage(multiMedya: _images)))
              .then((content){
                if(content == null && !context.mounted) return;
                Navigator.of(context).pop((images: _images,content: content as String));
              }),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 5),
                child: Text(
                  AppLocalizations.of(context)!.add_solution_images_page_continue_button,
                ),
              ),
              const Icon(
                Icons.arrow_forward,
              )
            ],
          )
        ),
      ),
      // body: Builder(
      //   builder: (context) {
      //     if(_images.isEmpty){
      //       return Padding(
      //         padding: const EdgeInsets.all(8),
      //         child: NoSolutionImageWidget(
      //           takeImage: _takeImage,
      //           takeImages: _takeImages,
      //         )
      //       );
      //     }
      //     return AppImageSlider(
      //       images: _images,
      //       removeImage: (image) => setState(() { _images = _images.where((e) => e != image); }),
      //     );
      //   }
      // ),
      floatingActionButton: _images.isNotEmpty 
        ? TakeMultimedyaSpeedDial(
          takeImages: _takeImages,
          takeVideo: null,
          takeImage: _takeImage,
          direction: SpeedDialDirection.left
        )
        : null
    );
  }
}