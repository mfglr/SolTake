import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/create_message_state/actions.dart';
import 'package:my_social_app/state/app_state/message_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/message_entity_state/message_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/store.dart';
import 'package:my_social_app/views/message/pages/conversation_page/conversation_page.dart';
import 'package:my_social_app/views/message/widgets/message_status_widget.dart';
import 'package:my_social_app/views/user/widgets/user_image_widget.dart';

class ConversationItem extends StatelessWidget {
  final MessageState message;
  const ConversationItem({super.key,required this.message});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,int>(
      converter: (store) => store.state.accountState!.id,
      builder: (context,accountId){
        return Card(
          child: TextButton(
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ConversationPage(userId: message.conversationId)));
              store.dispatch(ChangeReceiverIdAction(receiverId: message.conversationId));
              store.dispatch(MarkComingMessagesAsViewedAction(userId: message.conversationId));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 5),
                    child: UserImageWidget(userId: message.conversationId,diameter: 50),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        message.userName,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 5),
                            child: Text(
                              message.formatContent(25) ?? 'Image...',
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal
                              ),
                            ),
                          ),
                          if(message.isOwner)
                            MessageStatusWidget(message: message),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              StoreConnector<AppState,int>(
                converter: (store) => store.state.messageEntityState.selectNumberOfUnviewedMessagesOfUser(message.conversationId),
                builder: (context,count){
                  if(count > 0){
                    return Text(count.toString());
                  }
                  return const SizedBox.shrink();
                }
              )
              ],
            ),
          )
        );
      }
    );
  }
}