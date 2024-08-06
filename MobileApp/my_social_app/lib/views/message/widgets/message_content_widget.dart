import 'package:flutter/material.dart';
import 'package:my_social_app/state/message_entity_state/message_state.dart';
import 'package:my_social_app/views/message/widgets/single_message_image_widget.dart';

class MessageContentWidget extends StatelessWidget {
  final MessageState message;
  const MessageContentWidget({super.key,required this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...message.images.map((messageImage) => Padding(
          padding: const EdgeInsets.all(1.0),
          child: SingleMessageImageWidget(messageImage: messageImage),
        )),
        Builder(
          builder: (context){
            if(message.content == null) return const SizedBox.shrink();
            return Text(message.content!);
          }
        )
      ],
    );
  }
}