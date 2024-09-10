import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/message_entity_state/message_state.dart';
import 'package:my_social_app/views/message/widgets/message_images_grid/message_image_grid_widget.dart';

class MessageImagesGridWidget extends StatelessWidget {
  final MessageState message;
  const MessageImagesGridWidget({super.key,required this.message});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: message.numberOfImages == 1 ? 1 : 2,
        childAspectRatio: 1.0,
        mainAxisSpacing: 1.0,
        crossAxisSpacing: 1.0,
      ),
      itemCount: message.numberOfImages,
      itemBuilder:(context,index ) => MessageImageGridWidget(
        key: ValueKey(index),
        index: index,
        messageImage:  message.images.elementAt(index)
      )
    );
  }
}