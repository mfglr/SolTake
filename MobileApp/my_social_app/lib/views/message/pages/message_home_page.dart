import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/message_entity_state/message_state.dart';
import 'package:my_social_app/state/app_state/message_home_page_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/views/message/widgets/conversation_items.dart';

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
        child: StoreConnector<AppState,Iterable<MessageState>>(
          onInit: (store) => store.dispatch(const NextPageConversationsIfNoConversationsAction()),
          converter: (store) => store.state.selectConversations,
          builder: (context,messages) => ConversationItems(messages: messages)
        ),
      ),
    );
  }
}