import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/message_connection_entity_state/message_connection_state.dart';
import 'package:my_social_app/views/message/pages/conversation_page/widgets/message_connection_widget/message_connection_status_widget/message_connection_status_widget.dart';
import 'package:my_social_app/views/shared/app_avatar/app_avatar.dart';
import 'package:my_social_app/views/user/pages/user_page/pages/user_page_by_id.dart';

class MessageConnectionReadyWidget extends StatelessWidget {
  final MessageConnectionState messageConnection;
  const MessageConnectionReadyWidget({
    super.key,
    required this.messageConnection
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => 
        Navigator
          .of(context)
          .push(MaterialPageRoute(builder: (context) => UserPageById(userId: messageConnection.id))),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 5),
            child: AppAvatar(
              avatar: messageConnection,
              diameter: 55
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                messageConnection.userName,
                style: const TextStyle(
                  fontSize: 13,
                ),
              ),
              MessageConnectionStatusWidget(
                messageConnection: messageConnection
              )
            ],
          )
        ],
      ),
    );
  }
}