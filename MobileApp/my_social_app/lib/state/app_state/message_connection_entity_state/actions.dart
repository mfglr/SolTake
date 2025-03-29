import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/message_connection_entity_state/message_connection_state.dart';


@immutable
class MessageConnectionAction extends AppAction{
  const MessageConnectionAction();
}

@immutable
class LoadMessageConnectionAction extends MessageConnectionAction{
  final int userId;
  const LoadMessageConnectionAction({required this.userId});
}

@immutable
class UpdateMessageConnectionStateAction extends MessageConnectionAction{
  final MessageConnectionState state;
  const UpdateMessageConnectionStateAction({
    required this.state,
  });
}
