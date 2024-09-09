import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/message_entity_state/message_state.dart';
import 'package:my_social_app/views/message/widgets/message_images_grid/message_image_grid_widget.dart';

class MessageImagesGridWidget extends StatelessWidget {
  final MessageState message;
  const MessageImagesGridWidget({super.key,required this.message});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(
        message.images.length,
        (index) => MessageImageGridWidget(
          messageImage:  message.images.elementAt(index)
        )
      ),
    );
  }
}