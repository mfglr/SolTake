import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/l10n/app_localizations.dart';
import 'package:my_social_app/state/entity_state/pagination_state/action_dispathcers.dart';
import 'package:my_social_app/state/app_state/message_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/message_entity_state/message_state.dart';
import 'package:my_social_app/state/app_state/conversations_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/entity_state/id.dart';
import 'package:my_social_app/state/entity_state/pagination_state/pagination.dart';
import 'package:my_social_app/utilities/dialog_creator/dialog_creator.dart';
import 'package:my_social_app/views/message/pages/conversation_page/conversation_page.dart';
import 'package:my_social_app/views/message/pages/create_conversation_page/create_conversation_page.dart';
import 'package:my_social_app/views/message/pages/message_home_page/widgets/cancel_deletion_of_conversations_button.dart';
import 'package:my_social_app/views/message/pages/message_home_page/widgets/conversation_items.dart';
import 'package:my_social_app/views/message/pages/message_home_page/widgets/delete_conversations_button.dart';
import 'package:my_social_app/views/shared/app_title.dart';

class MessageHomePage extends StatefulWidget {
  
  const MessageHomePage({super.key});

  @override
  State<MessageHomePage> createState() => _MessageHomePageState();
}

class _MessageHomePageState extends State<MessageHomePage> {
  Iterable<int> _selectedConversations = [];

  void _onLongPress(int conversationId){
    setState(() { _selectedConversations = [..._selectedConversations, conversationId]; });
  }
  
  void _onPress(int conversationId, bool isSelected){
    if(_selectedConversations.isNotEmpty){
      if(isSelected){
        setState(() { _selectedConversations = _selectedConversations.where((e) => e != conversationId); });
      }
      else{
        setState(() { _selectedConversations = [..._selectedConversations, conversationId]; });
      }
    }
    else{
      Navigator
        .of(context)
        .push(MaterialPageRoute(builder: (context) => ConversationPage(userId: conversationId)));
      final store = StoreProvider.of<AppState>(context,listen: false);
      store.dispatch(MarkMessagesAsViewedAction(messageIds: store.state.selectIdsOfUserUnviewedMessages(conversationId)));
    }
  }

  void _clearSelectedConversations(){
    setState(() {
      _selectedConversations = [];
    });
  }

  void _deleteConversations(){
    DialogCreator
      .showAppDialog(
        context,
        AppLocalizations.of(context)!.message_home_page_delete_conversations_title,
        AppLocalizations.of(context)!.message_home_page_delete_conversations_content,
        AppLocalizations.of(context)!.message_home_page_content_aprove_button
      )
      .then((response){
        if(response && mounted){
          final store = StoreProvider.of<AppState>(context,listen: false);
          store.dispatch(RemoveMessagesByUserIdsAction(userIds: _selectedConversations));
        }
        _clearSelectedConversations();
      });
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,Pagination<num,Id<num>>>(
      converter: (store) => store.state.conversations,
      builder:(context,conversations) => Scaffold(
        appBar: AppBar(
          title: 
            _selectedConversations.isEmpty
              ? AppTitle(
                title: AppLocalizations.of(context)!.messages_home_page_title
              ) 
              : Text(_selectedConversations.length.toString())
          ,
          actions: _selectedConversations.isEmpty 
            ? null
            :  [
              CancelDeletionOfConversationsButton(clearConverations: _clearSelectedConversations),
              DeleteConversationsButton(deleteConversations: _deleteConversations)
            ]
        ),
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          onPressed: () => 
            Navigator
              .of(context)
              .push(MaterialPageRoute(builder: (context) => const CreateConversationPage())),
          child: const Icon(Icons.add),
        ),
        body: Padding(
          padding: const EdgeInsets.all(5),
          child: StoreConnector<AppState,Iterable<MessageState>>(
            onInit: (store) => getNextPageIfNoPage(store,conversations,const NextConversationsAction()),
            converter: (store) => store.state.selectConversations,
            builder: (context,messages) => ConversationItems(
              messages: messages,
              onLongPress: (conversationId) => _onLongPress(conversationId),
              onPress: _onPress,
              isSelected: (conversationId) => _selectedConversations.any((e) => e == conversationId),
              pagination: conversations,
              onScrollBottom: (){
                final store = StoreProvider.of<AppState>(context,listen: false);
                getNextPageIfReady(store, conversations, const NextConversationsAction());
              },
            )
          ),
        ),
      ),
    );
  }
}