import 'package:flutter/material.dart';
import 'package:my_social_app/state/user_user_conversation_state/user_user_conversation_state.dart';
import 'package:my_social_app/views/message/pages/create_conversation_page/widgets.dart/user_user_conversation_item.dart';
import 'package:my_social_app/views/shared/app_column.dart';

class UserUserConversationItems extends StatelessWidget {
  final Iterable<UserUserConversationState> userUserConversations;
  const UserUserConversationItems({
    super.key,
    required this.userUserConversations,
  });

  @override
  Widget build(BuildContext context) {
    return AppColumn(
      children: userUserConversations.map((e) => UserUserConversationItem(userUserConversation: e))
    );
  }
  
}
