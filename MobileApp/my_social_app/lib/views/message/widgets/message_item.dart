import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/message_entity_state/message_state.dart';
import 'package:my_social_app/views/message/widgets/message_content_widget.dart';
import 'package:my_social_app/views/message/widgets/message_images_grid/message_images_grid_widget.dart';
import 'package:my_social_app/views/message/widgets/message_status_widget.dart';
import 'package:timeago/timeago.dart' as timeago;

class MessageItem extends StatelessWidget {
  final MessageState message;
  
  const MessageItem({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if(message.numberOfImages > 0)
              MessageImagesGridWidget(message: message),
            if(message.content != null)
              MessageContentWidget(message: message),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if(message.isOwner)
                    MessageStatusWidget(message: message),
                  Text(
                    timeago.format(message.createdAt,locale: 'en_short'),
                    style: const TextStyle(fontSize: 11),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}