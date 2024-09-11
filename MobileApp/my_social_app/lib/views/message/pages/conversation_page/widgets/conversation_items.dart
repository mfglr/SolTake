import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/message_entity_state/message_state.dart';
import 'package:my_social_app/views/message/pages/conversation_page/widgets/conversation_item.dart';

class ConversationItems extends StatelessWidget {
  final Iterable<MessageState> messages;
  const ConversationItems({super.key,required this.messages});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        messages.length,
        (index) => ConversationItem(message: messages.elementAt(index))
      )
    );
  }
}