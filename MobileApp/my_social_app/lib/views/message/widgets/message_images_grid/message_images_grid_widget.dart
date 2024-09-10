import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/message_image_entity_state/message_image_state.dart';
import 'package:my_social_app/views/message/widgets/message_images_grid/message_image_grid_widget.dart';

class MessageImagesGridWidget extends StatelessWidget {
  final Iterable<MessageImageState> images;
  const MessageImagesGridWidget({super.key,required this.images});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: images.length == 1 ? 1 : 2,
            childAspectRatio: 1.0,
            mainAxisSpacing: 1.0,
            crossAxisSpacing: 1.0,
          ),
          itemCount: images.length,
          itemBuilder:(context, index) => MessageImageGridWidget(
            messageImage: images.elementAt(index)
          )
        ),
      ),
    );
  }
}