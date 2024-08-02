import 'package:flutter/material.dart';
import 'package:my_social_app/state/actions.dart' as redux;
import 'package:my_social_app/state/conversation_entity_state/conversation_state.dart';

@immutable
class LoadConversationByReceiverIdAction extends redux.Action{
  final int receiverId;
  const LoadConversationByReceiverIdAction({required this.receiverId});
}

@immutable
class AddConversationAction extends redux.Action{
  final ConversationState conversation;
  const AddConversationAction({required this.conversation});
}
@immutable
class AddConversationsAction extends redux.Action{
  final Iterable<ConversationState> conversations;
  const AddConversationsAction({required this.conversations});
}

@immutable
class AddConversationMessageAction extends redux.Action{
  final int conversationId;
  final int messageId;
  const AddConversationMessageAction({required this.conversationId,required this.messageId});
}

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
  final Iterable<int> ids;
  const NextPageConversationMessagesSuccessAction({required this.conversationId, required this.ids});
}

@immutable
class GetConversationsThatHaveUnviewedMessagesAction extends redux.Action{
  const GetConversationsThatHaveUnviewedMessagesAction();
}
@immutable
class GetConversationsThatHaveUnviewedMessagesSuccessAction extends redux.Action{
  final Iterable<ConversationState> conversations;
  const GetConversationsThatHaveUnviewedMessagesSuccessAction({required this.conversations});
}



