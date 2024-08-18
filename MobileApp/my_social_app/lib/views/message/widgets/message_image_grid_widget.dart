import 'package:flutter/material.dart';
import 'package:my_social_app/state/message_entity_state/actions.dart';
import 'package:my_social_app/state/message_entity_state/message_image_state.dart';
import 'package:my_social_app/state/store.dart';
import 'package:my_social_app/views/shared/loading_view.dart';

class MessageImageGridWidget extends StatefulWidget {
  final MessageImageState messageImage;
  const MessageImageGridWidget({super.key,required this.messageImage});

  @override
  State<MessageImageGridWidget> createState() => _MessageImageGridWidgetState();
}

class _MessageImageGridWidgetState extends State<MessageImageGridWidget> {
  @override
  void initState() {
    store.dispatch(
      LoadMessageImageAction(
        messageId: widget.messageImage.messageId,
        messageImageId: widget.messageImage.id
      )
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1),
      child: Builder(builder: (context) {
        if(widget.messageImage.image == null) return const LoadingView();
        return Image.memory(
          widget.messageImage.image!,
          fit: BoxFit.cover,
        );
      }),
    );
  }
}