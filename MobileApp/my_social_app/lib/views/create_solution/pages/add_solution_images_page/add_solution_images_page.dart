import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_social_app/constants/routes.dart';
import 'package:my_social_app/utilities/toast_creator.dart';
import 'package:my_social_app/views/create_solution/pages/add_solution_content_page.dart';
import 'package:my_social_app/views/create_solution/pages/add_solution_images_page/widgets/no_solution_image_widget.dart';
import 'package:my_social_app/views/create_solution/pages/add_solution_images_page/widgets/solution_carousel_slider_widget.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_social_app/views/shared/app_title.dart';

class AddSolutionImagesPage extends StatefulWidget {
  const AddSolutionImagesPage({super.key});
  @override
  State<AddSolutionImagesPage> createState() => _AddSolutionImagesPageState();
}

class _AddSolutionImagesPageState extends State<AddSolutionImagesPage> {
  late final TextEditingController contentController;
  Iterable<XFile> _images = [];

  void _addImage(){
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

  @override
  void initState() {
    contentController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    contentController.dispose();
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
        actions: [
          TextButton(
            onPressed: _addImage,
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 5),
                  child: Text(AppLocalizations.of(context)!.add_solution_images_page_add_photo_button)
                ),
                const Icon(Icons.add_a_photo)
              ],
            )
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8),
        child: OutlinedButton(
          onPressed: () => 
            Navigator
              .of(context)
              .push(MaterialPageRoute(builder: (context) => AddSolutionContentPage(images: _images)))
              .then((content) => Navigator.of(context).pop((images: _images,content: content as String))),
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
      body: Builder(
        builder: (context) {
          if(_images.isEmpty){
            return Padding(
              padding: const EdgeInsets.all(8),
              child: NoSolutionImageWidget(addImage: _addImage,)
            );
          }
          return SolutionCarouselSliderWidget(
            images: _images,
            removeImage: (image) => setState(() { _images = _images.where((e) => e != image); }),
          );
        }
      )
    );
  }
}