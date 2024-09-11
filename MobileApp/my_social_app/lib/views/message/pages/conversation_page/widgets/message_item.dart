import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/message_entity_state/message_state.dart';
import 'package:my_social_app/state/app_state/message_image_entity_state/message_image_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/views/message/pages/conversation_page/widgets/message_images_grid_widget.dart';
import 'package:my_social_app/views/message/pages/conversation_page/widgets/message_status_widget.dart';
import 'package:timeago/timeago.dart' as timeago;

class MessageItem extends StatelessWidget {
  final MessageState message;
  const MessageItem({
    super.key,
    required this.message
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Column(
          children: [
            if(message.numberOfImages > 0)
              StoreConnector<AppState,Iterable<MessageImageState>>(
                converter: (store) => store.state.messageImageEntityState.selectMessageImages(message.id),
                builder:(context,images) => MessageImagesGridWidget(images: images)
              ),
            if(message.content != null)
              Padding(
                padding: const EdgeInsets.only(top: 5,left: 5,right: 5),
                child: Text(message.content!),
              ),
            Padding(
              padding: const EdgeInsets.only(top: 5,left: 5,right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    timeago.format(message.createdAt,locale: 'en_short'),
                    style: const TextStyle(fontSize: 11),
                  ),
                  if(message.isOwner)
                    MessageStatusWidget(message: message),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}