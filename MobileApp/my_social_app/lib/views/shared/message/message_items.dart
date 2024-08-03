import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/message_entity_state/message_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/views/shared/message/message_item.dart';

class MessageItems extends StatelessWidget {
  final Iterable<MessageState> messages;
  const MessageItems({super.key,required this.messages});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        messages.length,
        (index) => Container(
          margin: const EdgeInsets.only(bottom: 15),
          child: Builder(
            builder: (context){
              final message = messages.elementAt(index);
              return StoreConnector<AppState,int>(
                converter: (store) => store.state.accountState!.id,
                builder: (store,accountId) => Row(
                  mainAxisAlignment: accountId == message.senderId ? MainAxisAlignment.end : MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 7.5 / 10,
                      child: MessageItem(message: message,),
                    )
                  ],
                ),
              );
            },
          ),
        )
      ),
    );
  }
}