import 'package:flutter/material.dart';
import 'package:my_social_app/state/actions.dart' as redux;
import 'package:my_social_app/state/conversation_entity_state/conversation_state.dart';

@immutable
class AddConversationAction extends redux.Action{
  final ConversationState conversation;
  const AddConversationAction({required this.conversation});
}

@immutable
class AddConversateMessageAction extends redux.Action{
  final int conversationId;
  final int messageId;
  final DateTime date;
  const AddConversateMessageAction({
    required this.conversationId,
    required this.messageId,
    required this.date,
  });
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


@immutable
class NextPageConversationsIfNoConversationsAction extends redux.Action{
  const NextPageConversationsIfNoConversationsAction();
}
@immutable
class NextPageConversationsAction extends redux.Action{
  const NextPageConversationsAction();
}
@immutable
class NextPageConversationsSuccessAction extends redux.Action{
  final Iterable<ConversationState> conversations;
  const NextPageConversationsSuccessAction({required this.conversations});
}




