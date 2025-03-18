import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/message_connection_entity_state/message_connection_state.dart';

@immutable
class LoadMessageConnectionAction{
  final int userId;
  const LoadMessageConnectionAction({required this.userId});
}
@immutable
class LoadMessageConnectionSuccessAction{
  final MessageConnectionState messageConnectionState;
  const LoadMessageConnectionSuccessAction({required this.messageConnectionState});
}

@immutable
class ChangeMessageConnectionStateAction{
  final MessageConnectionState state;

  const ChangeMessageConnectionStateAction({
    required this.state
  });
}
