import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/views/message/widgets/carousel_slider_widget.dart';
import 'package:my_social_app/views/message/widgets/message_field.dart';

class DisplayMessageImages extends StatelessWidget {
  const DisplayMessageImages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children:[
          
          Expanded(
            child: StoreConnector<AppState,Iterable<XFile>>(
              converter: (store) => store.state.createMessageState.images,
              builder: (context,images) => CarouselSliderWidget(images: images)
            ),
          ),
          
          const Padding(
            padding: EdgeInsets.only(bottom:15,top: 5),
            child: MessageField(
              hintText: "Type somethings",
              type: MessageFieldType.forDisplayMessageImages,
            ),
          )
          
        ]
      ),
    );
  }
}