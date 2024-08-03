import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/message_home_page_state/actions.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/user_entity_state/user_state.dart';
import 'package:my_social_app/views/shared/conversation/conversation_items.dart';

class MessageHomePage extends StatelessWidget {
  
  const MessageHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Messages"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: StoreConnector<AppState,Iterable<UserState>>(
          onInit: (store) => store.dispatch(const NextPageConversationsIfNoConversationsAction()),
          converter: (store) => store.state.selectConversations,
          builder: (context,conversations) => ConversationItems(users: conversations)
        ),
      ),
    );
  }
}