import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/user_user_conversation_state/user_user_conversation_state.dart';
import 'package:my_social_app/views/message/pages/conversation_page/conversation_page.dart';
import 'package:my_social_app/views/shared/user_item/user_item_widget.dart';

class UserUserConversationItem extends StatelessWidget {
  final UserUserConversationState userUserConversation;

  const UserUserConversationItem({
    super.key,
    required this.userUserConversation,
  });

  @override
  Widget build(BuildContext context) {
    return UserItemWidget(
      onPressed: () => 
        Navigator
          .of(context)
          .push(MaterialPageRoute(builder: (context) => ConversationPage(userId: userUserConversation.userId))),
      userItem: userUserConversation
    );
  }
}