import 'package:flutter/material.dart';
import 'package:my_social_app/models/conversation.dart';
import 'package:my_social_app/state/actions.dart' as redux;
import 'package:my_social_app/state/conversation_entity_state/conversation_state.dart';

@immutable
class SynchronizeHomePageAction extends redux.Action{
  const SynchronizeHomePageAction();
}
@immutable
class SynchronizeHomePageSuccessAction extends redux.Action{
  final Iterable<Conversation> conversations;
  const SynchronizeHomePageSuccessAction({required this.conversations});
}

@immutable
class PrependConversationAction extends redux.Action{
  final ConversationState conversation;
  const PrependConversationAction({required this.conversation});
}

@immutable
class NextPageConversationsAction extends redux.Action{
  const NextPageConversationsAction();
}
@immutable
class NextPageConversationsSuccessAction extends redux.Action{
  final Iterable<Conversation> conversations;  
  const NextPageConversationsSuccessAction({required this.conversations});
}
@immutable
class NextPageConversationsIfNoConversationsAction extends redux.Action{
  const NextPageConversationsIfNoConversationsAction();
}