import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/l10n/app_localizations.dart';
import 'package:my_social_app/services/message_hub.dart';
import 'package:my_social_app/state/user_message_state/actions.dart';
import 'package:my_social_app/state/user_message_state/user_message_state.dart';
import 'package:my_social_app/packages/entity_state/action_dispathcers.dart';
import 'package:my_social_app/state/message_entity_state/actions.dart';
import 'package:my_social_app/state/message_entity_state/message_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/views/message/pages/conversation_page/enums/message_deletion_type.dart';
import 'package:my_social_app/views/message/pages/conversation_page/widgets/delete_messages_dialog/delete_messages_dialog.dart';
import 'package:my_social_app/views/message/pages/conversation_page/widgets/message_connection_widget/message_connection_widget.dart';
import 'package:my_social_app/views/message/pages/conversation_page/widgets/message_item.dart';
import 'package:my_social_app/views/message/pages/conversation_page/widgets/message_text_field.dart';
import 'package:my_social_app/views/message/pages/conversation_page/widgets/scroll_to_bottom_button.dart';
import 'package:my_social_app/views/message/pages/display_message_images_page/display_message_images_page.dart';
import 'package:my_social_app/views/shared/loading_circle_widget.dart';
import 'package:my_social_app/views/shared/space_saving_widget.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';

class ConversationPage extends StatefulWidget {
  final int userId;
  const ConversationPage({super.key,required this.userId});
  @override
  State<ConversationPage> createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage>{

  final ScrollController _scrollController = ScrollController();
  int _numberOfNewMessages = 0;
  Iterable<MessageState> _selectedMessages = [];

  Future<MessageDeletionType?> _createDialog(BuildContext context)
    => showDialog(
        context: context,
        builder: (context) => DeleteMessagesDialog(messages: _selectedMessages,)
      );

  void _onLongPressed(MessageState message){
    if(!_selectedMessages.any((e) => e.id == message.id)){
      setState(() { _selectedMessages = [..._selectedMessages, message]; });
    }
  }
  void _onPressed(MessageState message,{int activeIndex = 0}){
    if(_selectedMessages.isEmpty && message.medias.isEmpty) return;
    if(_selectedMessages.isEmpty && message.medias.isNotEmpty){
      Navigator
        .of(context)
        .push(
          MaterialPageRoute(
            builder: (context) => DisplayMessageImagesPage(
              message: message,
              activeIndex: activeIndex
            )
          )
        );
      return;
    }
    if(_selectedMessages.any((e) => e.id == message.id)){
      setState(() { _selectedMessages = _selectedMessages.where((e) => e.id != message.id); });
      return;
    }
    setState(() { _selectedMessages = [..._selectedMessages, message]; });
  }
  void _clearAllSelectedIds() => setState(() { _selectedMessages = []; });
  void _onScrollBottom(){
    if(_scrollController.position.pixels == 0){
      setState(() { _numberOfNewMessages = 0; });
    }
  }
  void _onScrollTop(){
    if(_scrollController.hasClients && _scrollController.position.pixels == _scrollController.position.maxScrollExtent){
      final store = StoreProvider.of<AppState>(context,listen: false);
      var pagination = store.state.userMessageState.getValue(widget.userId)?.messageIds ?? UserMessageState.init(widget.userId).messageIds;
      getNextPageIfReady(store,pagination,NextUserMessagesAction(userId: widget.userId));
    }
  }
  
  void _onMessageReceived(MessageState message){
    
    if(message.senderId != widget.userId || !mounted) return;

    final store = StoreProvider.of<AppState>(context,listen: false);
    store.dispatch(MarkMessagesAsViewedAction(messageIds: [message.id]));
    if(_scrollController.position.pixels != 0){
      setState(() { _numberOfNewMessages++; });
    }
  }

  Widget _generateMessageItem(MessageState message){
    return GestureDetector(
      onTap: () => _onPressed(message),
      onLongPress: () => _onLongPressed(message),
      child: Container(
        color: _selectedMessages.any((e) => e.id == message.id) ? Colors.black.withAlpha(102) : null,
        margin: const EdgeInsets.only(bottom: 10),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: message.isOwner ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 3.45 / 4,
              child: MessageItem(
                key: ValueKey(message.id),
                onPressedMessageItem: _onPressed,
                message: message,
              )
            )
          ],
        )
      ),
    );
  }

  @override
  void initState() {
    final store = StoreProvider.of<AppState>(context,listen: false);
    var messageIds = store.state.selectIdsOfUserUnviewedMessages(widget.userId);
    MessageHub().markMessagesAsViewed(messageIds);

    MessageHub().changeStateToFocused(widget.userId);

    _scrollController.addListener(_onScrollBottom);
    _scrollController.addListener(_onScrollTop);

    MessageHub().onReceivedMessage((message) => _onMessageReceived(message.toMessageState()));

    super.initState();
  }

  @override
  void dispose() {
    MessageHub().chageStateToOnline();

    _scrollController.removeListener(_onScrollBottom);
    _scrollController.removeListener(_onScrollTop);
    _scrollController.dispose();

    MessageHub().offReceivedMessage();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _selectedMessages.isEmpty
          ? MessageConnectionWidget(userId: widget.userId)
          : Text(_selectedMessages.length.toString()),
        leading: _selectedMessages.isEmpty ? const AppBackButtonWidget() : const SpaceSavingWidget(),
        actions: [
          if(_selectedMessages.isNotEmpty)
            TextButton(
              onPressed: _clearAllSelectedIds,
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 4),
                    child: const Icon(Icons.cancel)
                  ),
                  Text(AppLocalizations.of(context)!.conversation_page_delete_cancel_button)
                ],
              )
            ),
          if(_selectedMessages.isNotEmpty)
            TextButton(
              onPressed: () =>
                _createDialog(context)
                  .then((value){
                    if(value == null || !context.mounted) return;
                    if(value == MessageDeletionType.cancel){
                      _clearAllSelectedIds();
                      return;
                    }
                    final store = StoreProvider.of<AppState>(context,listen: false);
                    store.dispatch(
                      RemoveMessagesAction(
                        userId: widget.userId,
                        messageIds: _selectedMessages.map((e) => e.id),
                        everyone: value == MessageDeletionType.deleteFromEveryone ? true : false
                      )
                    );
                    _clearAllSelectedIds();
                  }),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 4),
                    child: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                  Text(
                    AppLocalizations.of(context)!.conversation_page_delete_button,
                    style: const TextStyle(
                      color: Colors.red
                    ),
                  ),
                ],
              )
            )
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: StoreConnector<AppState,Iterable<MessageState>>(
                  onInit: (store) => getNextPageIfNoPage(
                    store,
                    store.state.userMessageState.getValue(widget.userId)?.messageIds ?? UserMessageState.init(widget.userId).messageIds,
                    NextUserMessagesAction(userId: widget.userId)
                  ),
                  converter: (store) => store.state.selectUserMessages(widget.userId),
                  builder: (context, messages){
                    return SingleChildScrollView(
                      controller: _scrollController,
                      reverse: true,
                      child: Column(
                        children: [
                          StoreConnector<AppState,bool?>(
                            converter: (store) => store.state.userMessageState.getValue(widget.userId)?.messageIds.loadingNext,
                            builder: (context, loadinNext) => loadinNext == null || loadinNext
                              ? const LoadingCircleWidget(strokeWidth: 3)
                              : const SpaceSavingWidget()
                          ),
                          ...messages.toList().reversed.map(_generateMessageItem),
                        ]
                      )
                    );
                  }
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5,5,5,20),
                child: MessageTextField(
                  hintText: AppLocalizations.of(context)!.conversation_page_message_field_hint_text,
                  scrollController: _scrollController,
                  receiverId: widget.userId,
                ),
              ),
            ],
          ),
          if(_numberOfNewMessages > 0)
            Positioned(
              left: 5,
              top: 15,
              child: ScrollToBottomButton(
                numberOfNewMessages: _numberOfNewMessages,
                scrollController: _scrollController
              )
            )
        ],
      ),
    );
  }
}