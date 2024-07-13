import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/constants/routes.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/store.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/carousel_slider_widget.dart';

class DisplayImagesPage extends StatelessWidget {

  const DisplayImagesPage({super.key});

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
      body: StoreConnector<AppState,List<XFile>>(
        converter: (store) => store.state.createQuestionState.images,
        builder: (context,images) => CarouselSliderWidget(images: images),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).pushNamed(takePictureRoute);
        },
        shape: const CircleBorder(),
        child: const Icon(Icons.camera),
      ),
    );
  }
}