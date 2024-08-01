import 'package:flutter/material.dart';
import 'package:my_social_app/state/actions.dart' as redux;
import 'package:my_social_app/state/message_entity_state/message_state.dart';

@immutable
class NextPageConversationMessagesIfNoMessagesAction extends redux.Action{
  final int conversationId;
  const NextPageConversationMessagesIfNoMessagesAction({required this.conversationId});
}
@immutable
class NextPageConversationMessagesAction extends redux.Action{
  final int conversationId;
  const NextPageConversationMessagesAction({required this.conversationId});
}
@immutable
class NextPageConversationMessagesSuccessAction extends redux.Action{
  final int conversationId;
  final Iterable<MessageState> messages;
  const NextPageConversationMessagesSuccessAction({required this.conversationId, required this.messages});
}