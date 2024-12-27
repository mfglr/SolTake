import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/message_entity_state/message_state.dart';
import 'package:my_social_app/views/message/pages/conversation_page/widgets/message_medias_grid_widget.dart';
import 'package:my_social_app/views/message/pages/conversation_page/widgets/message_status_widget.dart';
import 'package:my_social_app/views/shared/app_date_widget.dart';

class MessageItem extends StatefulWidget {
  final MessageState message;
  final void Function(int messageId) onPressedMesssageItem;
  final void Function(int messageId) onLongPressedMessageItem;
  final Iterable<int> selectedMessageIds;

  const MessageItem({
    super.key,
    required this.message,
    required this.onPressedMesssageItem,
    required this.onLongPressedMessageItem,
    required this.selectedMessageIds
  });

  @override
  State<MessageItem> createState() => _MessageItemState();
}

class _MessageItemState extends State<MessageItem> {
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onPressedMesssageItem(widget.message.id),
      onLongPress: () => widget.onLongPressedMessageItem(widget.message.id),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if(widget.message.medias.isNotEmpty)
                MessageImagesGridWidget(
                  message: widget.message,
                  onSelectedMessageItem: widget.onPressedMesssageItem,
                  selectedMessageIds: widget.selectedMessageIds,
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
      ),
    );
  }
}