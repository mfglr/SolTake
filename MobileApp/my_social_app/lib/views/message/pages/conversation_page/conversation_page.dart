import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/services/message_hub.dart';
import 'package:my_social_app/state/entity_state/action_dispathcers.dart';
import 'package:my_social_app/state/app_state/message_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/message_entity_state/message_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/upload_entity_state/upload_state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/user_entity_state/user_state.dart';
import 'package:my_social_app/utilities/dialog_creator.dart';
import 'package:my_social_app/views/display_uploads_page/widgets/upload_items.dart';
import 'package:my_social_app/views/message/pages/conversation_page/widgets/message_connection_widget/message_connection_widget.dart';
import 'package:my_social_app/views/message/pages/conversation_page/widgets/message_item.dart';
import 'package:my_social_app/views/message/pages/conversation_page/widgets/message_text_field.dart';
import 'package:my_social_app/views/message/pages/conversation_page/widgets/scroll_to_bottom_button.dart';
import 'package:my_social_app/views/message/pages/display_message_images_page/display_message_images_page.dart';
import 'package:my_social_app/views/shared/loading_circle_widget.dart';
import 'package:my_social_app/views/shared/loading_view.dart';
import 'package:my_social_app/views/shared/space_saving_widget.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ConversationPage extends StatefulWidget {
  final int userId;
  const ConversationPage({super.key,required this.userId});
  @override
  State<ConversationPage> createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage>{
  
  final ScrollController _scrollController = ScrollController();
  int _numberOfNewMessages = 0;
  Iterable<int> _selectedIds = [];

  void _onLongPressed(MessageState message){
    if(!_selectedIds.any((e) => e == message.id)){
      setState(() { _selectedIds = [..._selectedIds, message.id]; });
    }
  }
  void _onPressed(MessageState message,{int activeIndex = 0}){
    if(_selectedIds.isEmpty && message.medias.isEmpty) return;
    if(_selectedIds.isEmpty && message.medias.isNotEmpty){
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
    if(_selectedIds.any((e) => e == message.id)){
      setState(() { _selectedIds = _selectedIds.where((e) => e != message.id); });
      return;
    }
    setState(() { _selectedIds = [..._selectedIds, message.id]; });
  }
  void _clearAllSelectedIds() => setState(() { _selectedIds = []; });
  void _onScrollBottom(){
    if(_scrollController.position.pixels == 0){
      setState(() { _numberOfNewMessages = 0; });
    }
  }
  void _onScrollTop(){
    if(_scrollController.hasClients && _scrollController.position.pixels == _scrollController.position.maxScrollExtent){
      final store = StoreProvider.of<AppState>(context,listen: false);
      var pagination = store.state.userEntityState.getValue(widget.userId)!.messages;
      getNextPageIfReady(store,pagination,NextUserMessagesAction(userId: widget.userId));
    }
  }
  // void _onMessageReceived(MessageState message){
  //   if(message.senderId == widget.userId){
  //     if(!mounted) return;
  //     final store = StoreProvider.of<AppState>(context,listen: false);
  //     store.dispatch(MarkComingMessageAsViewedAction(messageId: message.id));
  //     if(_scrollController.position.pixels != 0){
  //       setState(() { _numberOfNewMessages++; });
  //     }
  //   }
  // }

  Widget _generateMessageItem(MessageState message){
    return GestureDetector(
      onTap: () => _onPressed(message),
      onLongPress: () => _onLongPressed(message),
      child: Container(
        color: _selectedIds.any((e) => e == message.id) ? Colors.black.withAlpha(102) : null,
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
    MessageHub().changeStateToFocused(widget.userId);

    _scrollController.addListener(_onScrollBottom);
    _scrollController.addListener(_onScrollTop);
    super.initState();
  }

  @override
  void dispose() {
    MessageHub().chageStateToOnline();

    _scrollController.removeListener(_onScrollBottom);
    _scrollController.removeListener(_onScrollTop);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, UserState?>(
      onInit: (store) => store.dispatch(LoadUserAction(userId: widget.userId)),
      converter: (store) => store.state.userEntityState.getValue(widget.userId),
      builder: (context,user){
        if(user == null) return const LoadingView();
        return Scaffold(
          appBar: AppBar(
            title: _selectedIds.isEmpty
              ? MessageConnectionWidget(userId: widget.userId)
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
                        if(value && context.mounted){
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
                      onInit: (store) => getNextPageIfNoPage(store,user.messages,NextUserMessagesAction(userId: widget.userId)),
                      converter: (store) => store.state.selectUserMessages(widget.userId),
                      builder: (context,messages){
                        return SingleChildScrollView(
                          controller: _scrollController,
                          reverse: true,
                          child: Column(
                            children: [
                              if(user.messages.loadingNext)
                                const LoadingCircleWidget(strokeWidth: 3),
                              ...messages.toList().reversed.map(_generateMessageItem),
                              StoreConnector<AppState,Iterable<UploadState>>(
                                converter: (store) => store.state.uploadEntityState.getUploadMessages(widget.userId),
                                builder: (context,items) => UploadItems(items: items),
                              )
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
    );
  }
}