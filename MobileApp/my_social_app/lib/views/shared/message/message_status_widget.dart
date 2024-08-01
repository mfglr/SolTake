import 'package:flutter/material.dart';
import 'package:my_social_app/state/message_entity_state/message_stataus.dart';
import 'package:my_social_app/state/message_entity_state/message_state.dart';

class MessageStatusWidget extends StatelessWidget {
  final MessageState message;
  const MessageStatusWidget({super.key,required this.message});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context){
        if(message.state == MessageStatus.created){
          return const Icon(Icons.done);
        }
        else if(message.state == MessageStatus.received){
          return const Icon(Icons.done_all);
        }
        else{
          return const Icon(Icons.done_all,color: Colors.blue,);
        }
      }
    );
  }
}