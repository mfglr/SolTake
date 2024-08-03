import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/message_entity_state/message_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/views/shared/message/message_status_widget.dart';
import 'package:timeago/timeago.dart' as timeago;

class MessageItem extends StatelessWidget {
  final MessageState message;
  const MessageItem({super.key,required this.message});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(message.content!),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  StoreConnector<AppState,int>(
                    converter: (store) => store.state.accountState!.id,
                    builder: (context,accountId){
                      if(accountId == message.senderId){
                        return MessageStatusWidget(message: message);
                      }
                      return const SizedBox.shrink();
                    }, 
                  ),
                  Text(
                    timeago.format(message.createdAt,locale: 'en_short'),
                    style: const TextStyle(fontSize: 11),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}