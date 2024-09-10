import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/message_entity_state/message_state.dart';
import 'package:my_social_app/views/message/widgets/message_status_widget.dart';
import 'package:timeago/timeago.dart' as timeago;

class MessageContentItem extends StatelessWidget {
  final MessageState message;
  
  const MessageContentItem({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      key: ValueKey(message.id),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(message.content!),
            Padding(
              padding: const EdgeInsets.only(top: 5),
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
            )
          ],
        ),
      ),
    );
  }
}