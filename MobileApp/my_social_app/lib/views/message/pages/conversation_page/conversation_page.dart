import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/services/message_hub.dart';
import 'package:my_social_app/state/app_state/create_message_state/actions.dart';
import 'package:my_social_app/state/app_state/message_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/message_entity_state/message_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/user_entity_state/user_state.dart';
import 'package:my_social_app/utilities/dialog_creator.dart';
import 'package:my_social_app/views/message/pages/conversation_page/widgets/scroll_to_bottom_button.dart';
import 'package:my_social_app/views/shared/loading_view.dart';
import 'package:my_social_app/views/shared/space_saving_widget.dart';
import 'package:my_social_app/views/user/pages/user_page.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/message/widgets/message_field.dart';
import 'package:my_social_app/views/message/pages/conversation_page/widgets/message_items.dart';
import 'package:my_social_app/views/user/widgets/user_image_with_names_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ConversationPage extends StatefulWidget {
  final int userId;
  const ConversationPage({super.key,required this.userId});
  @override
  State<ConversationPage> createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage>{
  final ScrollController _scrollController = ScrollController();
  late final StreamSubscription<MessageState> _messageConsumer;
  late final void Function() _onScrollBottom;

  Iterable<int> _selectedIds = [];
  void _onLongPressed(int messageId){
    if(_selectedIds.isEmpty){
      setState(() { _selectedIds = [..._selectedIds, messageId]; });
    }
  }
  void _onPressed(int messageId){
    if(_selectedIds.isNotEmpty){
      if(_selectedIds.any((e) => e == messageId)){
        setState(() { _selectedIds = _selectedIds.where((e) => e != messageId); });
      }
      else{
        setState(() { _selectedIds = [..._selectedIds, messageId]; });
      }
    }
  }
  void _clearAllSelectedIds(){
    setState(() { _selectedIds = []; });
  }

  int _numberOfNewMessages = 0;
  void _initNumberOfNewMessages(){
    setState(() { _numberOfNewMessages = 0; });
  }
  void _increaseNumberOfNewMessages(){
    setState(() { _numberOfNewMessages++; });
  }

  @override
  void initState() {
    final store = StoreProvider.of<AppState>(context,listen: false);
    store.dispatch(ChangeReceiverIdAction(receiverId: widget.userId));

    _onScrollBottom = (){
      if(_scrollController.position.pixels == 0){
        _initNumberOfNewMessages();
      }
    };
    _scrollController.addListener(_onScrollBottom);
    
    _messageConsumer = MessageHub().receivedMessages.stream.listen((message){
      if(message.senderId == widget.userId){
        store.dispatch(MarkComingMessageAsViewedAction(messageId: message.id));
        if(_scrollController.position.pixels != 0){
          _increaseNumberOfNewMessages();
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScrollBottom);
    _scrollController.dispose();
    _messageConsumer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,UserState?>(
      onInit: (store) => store.dispatch(LoadUserAction(userId: widget.userId)),
      converter: (store) => store.state.userEntityState.entities[widget.userId],
      builder: (context,user){
        if(user == null) return const LoadingView();
        return Scaffold(
          appBar: AppBar(
            title: _selectedIds.isEmpty 
              ? TextButton(
                onPressed: () =>
                  Navigator
                    .of(context)
                    .push(MaterialPageRoute(builder: (context) => UserPage(userId: widget.userId))),
                style: ButtonStyle(
                  padding: WidgetStateProperty.all(EdgeInsets.zero),
                  minimumSize: WidgetStateProperty.all(const Size(0, 0)),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: UserImageWithNamesWidget(
                  user: user,
                  diameter: 50,
                  marginRight: 5,
                  userNameFontSize: 12,
                  userNameFontWeight: FontWeight.bold,
                  nameFontSize: 11,
                  nameFontWeight: FontWeight.normal,
                )
              ) 
              : Text(_selectedIds.length.toString()),
            leading: _selectedIds.isEmpty ? const AppBackButtonWidget() : const SpaceSavingWidget(),
            actions: [
              if(_selectedIds.isNotEmpty)
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
              if(_selectedIds.isNotEmpty)
                TextButton(
                  onPressed: () => 
                    DialogCreator
                      .showAppDialog(
                        context,
                        AppLocalizations.of(context)!.conversation_page_delete_dialog_title,
                        AppLocalizations.of(context)!.conversation_page_delete_dialog_content,
                        AppLocalizations.of(context)!.show_app_dialog_delete_button
                      )
                      .then((value){
                        if(value){
                          final store = StoreProvider.of<AppState>(context,listen: false);
                          store.dispatch(RemoveMessagesAction(userId: widget.userId, messageIds: _selectedIds));
                          _clearAllSelectedIds();
                        }
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
                      onInit: (store) => store.dispatch(GetNextPageUserMessagesIfNoPageAction(userId: widget.userId)),
                      converter: (store) => store.state.selectUserMessages(widget.userId),
                      builder: (context,messages){
                        return MessageItems(
                          messages: messages,
                          pagination: user.messages,
                          spaceBottom: 10,
                          numberOfNewMessages: _numberOfNewMessages,
                          scrollController: _scrollController,
                          onScrollTop: (){
                            final store = StoreProvider.of<AppState>(context,listen: false);
                            store.dispatch(GetNextPageUserMessagesIfReadyAction(userId: widget.userId));
                          },
                          onPressedMessageItem: _onPressed,
                          onLongPressedMessageItem: _onLongPressed,
                          selectedMessageIds: _selectedIds,
                        );
                      }
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5,5,5,20),
                    child: MessageField(
                      hintText: AppLocalizations.of(context)!.conversation_page_message_field_hint_text,
                      type: MessageFieldType.forConversation,
                      scrollController: _scrollController,
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
    );
  }
}