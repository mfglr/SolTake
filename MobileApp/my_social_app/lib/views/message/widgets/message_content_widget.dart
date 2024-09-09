import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/message_entity_state/message_state.dart';

class MessageContentWidget extends StatelessWidget {
  final MessageState message;
  const MessageContentWidget({super.key,required this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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