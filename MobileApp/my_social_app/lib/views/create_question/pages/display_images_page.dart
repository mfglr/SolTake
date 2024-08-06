import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/constants/routes.dart';
import 'package:my_social_app/state/create_question_state/actions.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/store.dart';
import 'package:my_social_app/views/create_question/widgets/carousel_slider_widget.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';

class DisplayImagesPage extends StatefulWidget {

  const DisplayImagesPage({super.key});

  @override
  State<DisplayImagesPage> createState() => _DisplayImagesPageState();
}

class _DisplayImagesPageState extends State<DisplayImagesPage> {

  @override
  void dispose() {
    store.dispatch(const ClearCreateQuestionStateAction());
    super.dispose();
  }

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButtonWidget(),
        actions: [
          TextButton(
            onPressed: () async {
              if(store.state.createQuestionState.images.isEmpty){
                throw "You must upload at least an image!";
              }
              if(store.state.createQuestionState.images.length > 5){
                throw "You can upload up to 5 images per question";
              }
              await Navigator.of(context).pushNamed(selectExamRoute);
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Select Exam"),
                Icon(Icons.navigate_next)
              ],
            ),
          ),
        ],
      ),
      body: StoreConnector<AppState,Iterable<XFile>>(
        converter: (store) => store.state.createQuestionState.images,
        builder: (context,images) => CarouselSliderWidget(images: images),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed(takeQuestionImageRoute),
        shape: const CircleBorder(),
        child: const Icon(Icons.photo_camera),
      ),
    );
  }
}