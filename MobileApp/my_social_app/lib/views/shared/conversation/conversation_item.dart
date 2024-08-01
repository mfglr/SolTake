import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/conversation_entity_state/conversation_state.dart';
import 'package:my_social_app/state/message_entity_state/message_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/views/shared/user/user_image_widget.dart';

class ConversationItem extends StatelessWidget {
  final ConversationState conversation;
  const ConversationItem({super.key,required this.conversation});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: TextButton(
        onPressed: (){},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 5),
                  child: UserImageWidget(userId: conversation.userId, diameter: 50)
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      conversation.userName,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    StoreConnector<AppState,MessageState?>(
                      converter: (store) => store.state.getConversationLastMessage(conversation.id),
                      builder: (context,message){
                        if(message != null){
                          return Text(
                            message.content ?? "",
                            style: const TextStyle(fontSize: 12),
                          );
                        }
                        return const SizedBox.shrink();
                      }, 
                    )
                  ],
                )
              ],
            ),
            StoreConnector<AppState,int>(
              converter: (store) => store.state.getNumberOfUnviewedMessagesOfConversation(conversation.id),
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