import 'package:flutter/material.dart';
import 'package:my_social_app/state/message_entity_state/message_state.dart';
import 'package:my_social_app/state/message_entity_state/message_status.dart';

class MessageStatusWidget extends StatelessWidget {
  final MessageState message;
  const MessageStatusWidget({super.key,required this.message});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context){
        IconData icon;
        MaterialColor? color;
        if(message.state == MessageStatus.created){
          icon = Icons.done;
        }
        else if(message.state == MessageStatus.received){
          icon = Icons.done_all;
        }
        else{
          icon = Icons.done_all;
          color = Colors.blue; 
        }
        return Icon(icon,color: color,size: 14);
      }
    );
  }
}