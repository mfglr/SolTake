import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/constants/message_functions.dart';
import 'package:my_social_app/models/message.dart';
import 'package:my_social_app/services/message_hub.dart';
import 'package:my_social_app/state/message_entity_state/actions.dart';
import 'package:my_social_app/state/message_entity_state/message_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/store.dart';
import 'package:my_social_app/state/user_entity_state/actions.dart';
import 'package:my_social_app/state/user_entity_state/user_state.dart';
import 'package:my_social_app/views/loading_view.dart';
import 'package:my_social_app/views/pages/user/user_page.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/message/message_field.dart';
import 'package:my_social_app/views/shared/message/message_items.dart';
import 'package:my_social_app/views/shared/user/user_image_with_names_widget.dart';

class ConversationPage extends StatefulWidget {
  final int userId;
  const ConversationPage({super.key,required this.userId});

  @override
  State<ConversationPage> createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  
  @override
  void initState() {
    MessageHub().hubConnection
      .on(
        receiveMessage2, 
        (list){
          final message = Message.fromJson((list!.first as dynamic));
          if(message.senderId == widget.userId){
            store.dispatch(
              MarkComingMessageAsViewedAction(
                messageId: message.id
              )
            );
          }
        }
      );
    super.initState();
  }

  @override
  void dispose() {
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
                      builder: (context) => UserPage(
                        userId: widget.userId,
                        userName: null
                      )
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
            body: Column(
              children: [
                StoreConnector<AppState,Iterable<MessageState>>(
                  onInit: (store) => store.dispatch(NextPageUserMessagesIfNoMessagesAction(userId: widget.userId)),
                  converter: (store) => store.state.messageEntityState.selectUserMessages(widget.userId),
                  builder: (context,messages) => Expanded(
                    child: SingleChildScrollView(
                      child: MessageItems(messages: messages)
                    ),
                  ), 
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5,5,5,20),
                  child: MessageField(userName: user.userName,),
                ),
              ],
            ),
          );
        }
        return const LoadingView();
      }
    );
  }
}