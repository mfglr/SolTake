import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/message_connection_entity_state/message_connection_state.dart';

@immutable
class LoadMessageConnectionState{
  final int userId;
  const LoadMessageConnectionState({required this.userId});
}
@immutable
class LoadMessageConnectionStateSuccessAction{
  final MessageConnectionState messageConnectionState;
  const LoadMessageConnectionStateSuccessAction({required this.messageConnectionState});
}
