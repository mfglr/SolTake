import 'package:flutter/material.dart';
import 'package:my_social_app/state/message_entity_state/message_state.dart';
import 'package:my_social_app/views/shared/message/message_status_widget.dart';
import 'package:my_social_app/views/shared/user/user_image_widget.dart';
import 'package:timeago/timeago.dart' as timeago;

class MessageItem extends StatelessWidget {
  final MessageState message;
  const MessageItem({super.key,required this.message});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            UserImageWidget(userId: message.ownerId, diameter: 40),
            Text(message.content!),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MessageStatusWidget(message: message,),
                Text(
                  timeago.format(message.createdAt,locale: 'en_short')
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}