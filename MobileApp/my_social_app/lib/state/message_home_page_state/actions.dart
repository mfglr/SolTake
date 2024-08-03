import 'package:flutter/material.dart';
import 'package:my_social_app/state/actions.dart' as redux;

@immutable
class GetNewMessageSendersAction extends redux.Action{
  const GetNewMessageSendersAction();
}
@immutable
class GetNewMessageSendersSuccessAction extends redux.Action{
  final Iterable<int> userIds;
  const GetNewMessageSendersSuccessAction({required this.userIds});
}

@immutable
class NextPageConversationsAction extends redux.Action{
  const NextPageConversationsAction();
}
@immutable
class NextPageConversationsSuccessAction extends redux.Action{
  final Iterable<int> userIds;  
  const NextPageConversationsSuccessAction({required this.userIds});
}
@immutable
class NextPageConversationsIfNoConversationsAction extends redux.Action{
  const NextPageConversationsIfNoConversationsAction();
}