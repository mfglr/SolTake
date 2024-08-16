import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/message_entity_state/message_image_state.dart';
import 'package:my_social_app/views/message/widgets/message_image_grid_widget.dart';

class MessageImagesGridWidget extends StatelessWidget {
  final Iterable<MessageImageState> messageImages;
  const MessageImagesGridWidget({super.key,required this.messageImages});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(
        messageImages.length,
        (index) => MessageImageGridWidget(
          messageImage: messageImages.elementAt(index)
        )
      ),
    );
  }
}