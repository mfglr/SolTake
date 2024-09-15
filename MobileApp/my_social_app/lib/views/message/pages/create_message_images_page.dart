import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/views/message/widgets/carousel_slider_widget.dart';
import 'package:my_social_app/views/message/widgets/message_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CreateMessageImagesPage extends StatelessWidget {
  const CreateMessageImagesPage({super.key});

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
          
          Padding(
            padding: const EdgeInsets.only(bottom:15,top: 5),
            child: MessageField(
              hintText: AppLocalizations.of(context)!.create_message_images_page_message_field_hint_text,
              type: MessageFieldType.forDisplayMessageImages,
            ),
          )
          
        ]
      ),
    );
  }
}