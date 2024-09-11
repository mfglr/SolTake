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
import 'package:my_social_app/views/message/pages/conversation_page/widgets/scroll_to_bottom_button.dart';
import 'package:my_social_app/views/shared/loading_view.dart';
import 'package:my_social_app/views/user/pages/user_page.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/message/widgets/message_field.dart';
import 'package:my_social_app/views/message/pages/conversation_page/widgets/message_items.dart';
import 'package:my_social_app/views/user/widgets/user_image_with_names_widget.dart';

class ConversationPage extends StatefulWidget {
  final int userId;
  const ConversationPage({super.key,required this.userId});
  @override
  State<ConversationPage> createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage>{

  int _numberOfNewMessages = 0;
  final ScrollController _scrollController = ScrollController();
  late final StreamSubscription<MessageState> _messageConsumer;
  late final void Function() _onScrollBottom;

  @override
  void initState() {
    final store = StoreProvider.of<AppState>(context,listen: false);
    store.dispatch(ChangeReceiverIdAction(receiverId: widget.userId));

    _onScrollBottom = (){
      if(_scrollController.position.pixels == 0){
        setState(() {
          _numberOfNewMessages = 0;
        });
      }
    };
    _scrollController.addListener(_onScrollBottom);
    
    _messageConsumer = MessageHub().receivedMessages.stream.listen((message){
      if(message.senderId == widget.userId){
        store.dispatch(MarkComingMessageAsViewedAction(messageId: message.id));
        if(_scrollController.position.pixels != 0){
          setState(() { _numberOfNewMessages++; });
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
            title: TextButton(
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserPage(userId: widget.userId)));
              },
              child: UserImageWithNamesWidget(
                user: user,
                diameter: 50,
                marginRight: 5,
                userNameFontSize: 12,
                userNameFontWeight: FontWeight.bold,
                nameFontSize: 11,
                nameFontWeight: FontWeight.normal,
              )
            ),
            leading: const AppBackButtonWidget(),
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
                        );
                      }
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5,5,5,20),
                    child: MessageField(
                      hintText: "Say hello to ${user.userName}",
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