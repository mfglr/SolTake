import 'package:flutter/material.dart';
import 'package:my_social_app/models/message.dart';
import 'package:my_social_app/state/app_state/actions.dart' as redux;

@immutable
class GetCommingMessagesAction extends redux.Action{
  const GetCommingMessagesAction();
}
@immutable
class GetComingMessagesSuccessAction extends redux.Action{
  const GetComingMessagesSuccessAction();
}

@immutable
class NextPageConversationsAction extends redux.Action{
  const NextPageConversationsAction();
}
@immutable
class NextPageConversationsSuccessAction extends redux.Action{
  final Iterable<Message> messages;  
  const NextPageConversationsSuccessAction({required this.messages});
}
@immutable
class NextPageConversationsIfNoConversationsAction extends redux.Action{
  const NextPageConversationsIfNoConversationsAction();
}