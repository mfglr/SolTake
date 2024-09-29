import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/message_entity_state/message_state.dart';
import 'package:my_social_app/views/message/pages/message_home_page/widgets/conversation_item.dart';

class ConversationItems extends StatelessWidget {
  final Iterable<MessageState> messages;
  final void Function(int conversationId) onLongPress;
  final void Function(int converationId,bool isSelected) onPress;
  final bool Function(int conversationId) isSelected;
  const ConversationItems({
    super.key,
    required this.messages,
    required this.onLongPress,
    required this.onPress,
    required this.isSelected
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        messages.length,
        (index) => ConversationItem(
          message: messages.elementAt(index),
          onLongPressed: onLongPress,
          onPress: onPress,
          isSelected: isSelected(messages.elementAt(index).conversationId),
        )
      )
    );
  }
}