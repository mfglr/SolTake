import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/message_image_entity_state/message_image_state.dart';
import 'package:my_social_app/views/message/pages/conversation_page/widgets/message_image_grid_widget.dart';

class MessageImagesGridWidget extends StatelessWidget {
  final Iterable<MessageImageState> images;
  final Iterable<int> selectedMessageIds;
  final void Function(int messageId) onSelectedMessageItem;
  const MessageImagesGridWidget({
    super.key,
    required this.images,
    required this.selectedMessageIds,
    required this.onSelectedMessageItem
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: images.length == 1 ? 1 : 2,
          childAspectRatio: 1,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
        ),
        itemCount: images.length,
        itemBuilder:(context, index) => MessageImageGridWidget(
          messageImage: images.elementAt(index),
          selectedMessageIds: selectedMessageIds,
          onPressMessageItem: onSelectedMessageItem,
        )
      ),
    );
  }
}