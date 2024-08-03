import 'package:flutter/material.dart';
import 'package:my_social_app/state/user_entity_state/user_state.dart';
import 'package:my_social_app/views/shared/conversation/conversation_item.dart';

class ConversationItems extends StatelessWidget {
  final Iterable<UserState> users;
  const ConversationItems({super.key,required this.users});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        users.length,
        (index) => Container(
          margin: const EdgeInsets.only(bottom: 15),
          child: ConversationItem(user: users.elementAt(index)),
        )
      )
    );
  }
}