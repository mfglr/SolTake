import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/message_entity_state/message_state.dart';
import 'package:my_social_app/state/app_state/message_home_page_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/views/message/pages/message_home_page/widgets/conversation_items.dart';
import 'package:my_social_app/views/shared/app_title.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MessageHomePage extends StatelessWidget {
  
  const MessageHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppTitle(
          title: AppLocalizations.of(context)!.messages_home_page_title
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: StoreConnector<AppState,Iterable<MessageState>>(
          onInit: (store) => store.dispatch(const GetNextPageConversationsIfNoPageAction()),
          converter: (store) => store.state.selectConversations,
          builder: (context,messages) => ConversationItems(messages: messages)
        ),
      ),
    );
  }
}