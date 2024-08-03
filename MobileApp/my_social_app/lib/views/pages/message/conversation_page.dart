import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/message_entity_state/message_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/user_entity_state/actions.dart';
import 'package:my_social_app/state/user_entity_state/user_state.dart';
import 'package:my_social_app/views/pages/user/user_page.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/message/message_field.dart';
import 'package:my_social_app/views/shared/message/message_items.dart';
import 'package:my_social_app/views/shared/user/user_image_with_names_widget.dart';

class ConversationPage extends StatelessWidget {
  final UserState user;
  const ConversationPage({super.key,required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextButton(
          onPressed: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => UserPage(
                  userId: user.id,
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
            onInit: (store) => store.dispatch(NextPageUserMessagesIfNoMessagesAction(userId: user.id)),
            converter: (store) => store.state.messageEntityState.selectUserMessages(user.id),
            builder: (context,messages) => Expanded(
              child: SingleChildScrollView(
                child: MessageItems(messages: messages)
              ),
            ), 
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5,5,5,20),
            child: MessageField(userName: user.userName,),
          )
        ],
      ),
    );
  }
}