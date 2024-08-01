import 'package:flutter/material.dart';
import 'package:my_social_app/state/conversation_entity_state/conversation_state.dart';
import 'package:my_social_app/views/shared/conversation/conversation_item.dart';

class ConversationItems extends StatelessWidget {
  final Iterable<ConversationState> conversations;
  const ConversationItems({super.key,required this.conversations});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        conversations.length,
        (index) => Container(
          margin: const EdgeInsets.only(bottom: 15),
          child: ConversationItem(conversation: conversations.elementAt(index)),
        )
      )
    );
  }
}