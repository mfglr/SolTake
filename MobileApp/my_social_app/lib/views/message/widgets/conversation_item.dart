import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/create_message_state/actions.dart';
import 'package:my_social_app/state/message_entity_state/actions.dart';
import 'package:my_social_app/state/message_entity_state/message_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/store.dart';
import 'package:my_social_app/views/message/pages/conversation_page.dart';
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
        final userId = message.senderId == accountId ? message.receiverId : message.senderId;
        final userName = message.senderId == accountId ? message.receiverUserName : message.senderUserName;
        return Card(
          child: TextButton(
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ConversationPage(userId: userId)));
              store.dispatch(ChangeReceiverIdAction(receiverId: userId));
              store.dispatch(MarkComingMessagesAsViewedAction(userId: userId));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 5),
                    child: UserImageWidget(userId: userId,diameter: 50),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userName,
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
                              message.content ?? 'Image...',
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal
                              ),
                            ),
                          ),
                          Builder(
                            builder: (context) {
                              if(accountId == message.senderId){
                                return MessageStatusWidget(message: message);
                              }
                              return const SizedBox.shrink();
                            }
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
              StoreConnector<AppState,int>(
                converter: (store) => store.state.messageEntityState.selectNumberOfUnviewedMessagesOfUser(userId),
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