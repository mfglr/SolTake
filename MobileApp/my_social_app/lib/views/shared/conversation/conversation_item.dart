import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/create_message_state/actions.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/store.dart';
import 'package:my_social_app/state/user_entity_state/user_state.dart';
import 'package:my_social_app/views/pages/message/conversation_page.dart';
import 'package:my_social_app/views/shared/user/user_image_with_names_widget.dart';

class ConversationItem extends StatelessWidget {
  final UserState user;
  const ConversationItem({super.key,required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: TextButton(
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ConversationPage(user: user)));
          store.dispatch(ChangeReceiverIdAction(receiverId: user.id));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            UserImageWithNamesWidget(
              user: user,
              diameter: 50,
              marginRight: 5,
              userNameFontSize: 14,
              nameFontSize: 12,
              userNameFontWeight: FontWeight.bold,
              nameFontWeight: FontWeight.normal
            ),
            StoreConnector<AppState,int>(
              converter: (store) => store.state.getNumberOfUnviewedMessagesOfConversation(user.id),
              builder: (context,count){
                if(count > 0){
                  return Text(count.toString());
                }
                return const SizedBox.shrink();
              }
            )
          ],
        ),
      ),
    );
  }
}