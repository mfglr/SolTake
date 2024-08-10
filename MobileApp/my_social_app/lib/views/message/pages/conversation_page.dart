import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/constants/message_functions.dart';
import 'package:my_social_app/models/message.dart';
import 'package:my_social_app/services/message_hub.dart';
import 'package:my_social_app/state/message_entity_state/actions.dart';
import 'package:my_social_app/state/message_entity_state/message_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/user_entity_state/actions.dart';
import 'package:my_social_app/state/user_entity_state/user_state.dart';
import 'package:my_social_app/views/shared/loading_view.dart';
import 'package:my_social_app/views/user/pages/user_page.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/message/widgets/message_field.dart';
import 'package:my_social_app/views/message/widgets/message_items.dart';
import 'package:my_social_app/views/user/widgets/user_image_with_names_widget.dart';
import 'package:badges/badges.dart' as badges;

class ConversationPage extends StatefulWidget {
  final int userId;
  const ConversationPage({super.key,required this.userId});
  @override
  State<ConversationPage> createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage>{
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _lastMessageKey = GlobalKey();
  int _numberOfNewMessages = 0;

  void _markUserMessagesAsViewed(){
    MessageHub()
      .hubConnection
      .on(
        receiveMessage2,
        (list){
          final store = StoreProvider.of<AppState>(context,listen: false);
          final message = Message.fromJson((list!.first as dynamic));
          if(message.senderId == widget.userId){
            store.dispatch(MarkComingMessageAsViewedAction(messageId: message.id));
          }
        }
      );
  }

  void _getNextMessages(){
    if(_scrollController.hasClients && _scrollController.position.pixels == 0){
      final store = StoreProvider.of<AppState>(context,listen: false);
      store.dispatch(GetNextPageUserMessagesIfReadyAction(userId: widget.userId));
    }
  }

  @override
  void initState() {
    _scrollController.addListener(_getNextMessages);
    _markUserMessagesAsViewed();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_getNextMessages);
    _scrollController.dispose();
    MessageHub().hubConnection.off(receiveMessage2);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,UserState?>(
      onInit: (store) => store.dispatch(LoadUserAction(userId: widget.userId)),
      converter: (store) => store.state.userEntityState.entities[widget.userId],
      builder: (context,user){
        if(user != null){
           return Scaffold(
            appBar: AppBar(
              title: TextButton(
                onPressed: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => UserPage(userId: widget.userId)
                    )
                  );
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
                        converter: (store) => store.state.messageEntityState.selectUserMessages(widget.userId),
                        builder: (context,messages){
                          return MessageItems(
                            messages: messages,
                            pagination: user.messages,
                            spaceBottom: 10,
                            scrollController: _scrollController,
                            lastMessageKey: _lastMessageKey,
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
                Builder(
                  builder: (context) {
                    if(_numberOfNewMessages > 0){
                      return Positioned(
                        child: FilledButton(
                          style: ButtonStyle(
                            shape: WidgetStateProperty.all<CircleBorder>(
                              const CircleBorder()
                            )
                          ),
                          onPressed: (){
                            setState(() {_numberOfNewMessages = 0;});
                            _scrollController.animateTo(
                              0,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.linear
                            );
                          },
                          child: badges.Badge(
                            badgeContent: Text(
                              _numberOfNewMessages.toString(),
                              style: const TextStyle(fontSize: 12),
                            ),
                            badgeStyle: const badges.BadgeStyle(badgeColor: Colors.grey),
                            child: const Icon(Icons.keyboard_arrow_down_sharp),
                          )
                        )
                      );
                    }
                    return const SizedBox.shrink();
                  }
                )
              ],
            ),
          );
        }
        return const LoadingView();
      }
    );
  }
}