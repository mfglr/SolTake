import 'package:flutter/material.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/state/app_state/message_entity_state/message_state.dart';
import 'package:my_social_app/views/message/pages/conversation_page/widgets/message_status_widget.dart';
import 'package:my_social_app/views/shared/app_date_widget.dart';
import 'package:multimedia_grid/multimedias_grid_for_message.dart';

class MessageItem extends StatefulWidget {
  final MessageState message;
  final void Function(MessageState message,{int activeIndex}) onPressedMessageItem;
  const MessageItem({
    super.key,
    required this.message,
    required this.onPressedMessageItem
  });

  @override
  State<MessageItem> createState() => _MessageItemState();
}

class _MessageItemState extends State<MessageItem> {
  
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if(widget.message.medias.isNotEmpty)
              MultimediasGridForMessage(
                medias: widget.message.medias,
                blobServiceUrl: AppClient.blobService,
                headers: AppClient().getHeader(),
                noMediaPath: "assets/images/no_image.jpg",
                notFoundMediaPath: "assets/images/no_image.jpg",
                onTap: (index) => widget.onPressedMessageItem(widget.message,activeIndex: index),
              ),
            if(widget.message.content != null)
              Padding(
                padding: const EdgeInsets.only(top: 5,left: 5,right: 5),
                child: Text(widget.message.content!),
              ),
            Padding(
              padding: const EdgeInsets.only(top: 5,left: 5,right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppDateWidget(
                    dateTime: widget.message.createdAt,
                    style: const TextStyle(fontSize: 11),
                  ),
                  if(widget.message.isOwner)
                    MessageStatusWidget(message: widget.message),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}