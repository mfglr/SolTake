import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/conversation_entity_state/action.dart';
import 'package:my_social_app/state/conversation_entity_state/conversation_state.dart';
import 'package:my_social_app/state/message_entity_state/message_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/user_entity_state/actions.dart';
import 'package:my_social_app/state/user_entity_state/user_state.dart';
import 'package:my_social_app/views/pages/user/user_page.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/message/message_items.dart';
import 'package:my_social_app/views/shared/user/user_image_with_names_widget.dart';

class ConversationPage extends StatelessWidget {
  final int userId;
  const ConversationPage({super.key,required this.userId,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: TextButton(
            onPressed: (){
              Navigator
                .of(context)
                .push(
                  MaterialPageRoute(
                    builder: (context) => UserPage(
                      userId: userId,
                      userName: null
                    )
                  )
                );
            },
            child: StoreConnector<AppState,UserState?>(
              onInit: (store) => store.dispatch(LoadUserAction(userId: userId)),
              converter: (store) => store.state.userEntityState.entities[userId],
              builder: (context,user){
                if(user == null) return const SizedBox.shrink();
                return UserImageWithNamesWidget(
                  user: user,
                  diameter: 50,
                  marginRight: 5,
                  userNameFontSize: 12,
                  userNameFontWeight: FontWeight.bold,
                  nameFontSize: 11,
                  nameFontWeight: FontWeight.normal,
                );
              }
            )
          ),
          leading: const AppBackButtonWidget(),
        ),
        body: StoreConnector<AppState,ConversationState?>(
          onInit: (store) => store.dispatch(LoadConversationByReceiverIdAction(receiverId: userId)),
          converter: (store) => store.state.conversationEntityState.selectByUserId(userId),
          builder: (context,conversation) => StoreConnector<AppState,Iterable<MessageState>>(
            onInit: (store){
              if(conversation != null){
                store.dispatch(
                  NextPageConversationMessagesIfNoMessagesAction(
                    conversationId: conversation.id
                  )
                );
              }
            },
            converter: (store){
              if(conversation != null) return store.state.getConversationMessages(conversation.id);
              return [];
            },
            builder: (context,messages) => SingleChildScrollView(
              child: MessageItems(
                messages: messages
              )
            ), 
          ),
        ),
      ),
    );
  }
}