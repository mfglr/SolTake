import 'package:flutter/material.dart';
import 'package:my_social_app/models/user.dart';
import 'package:my_social_app/state/actions.dart' as redux;

@immutable
class GetNewMessageSendersAction extends redux.Action{
  const GetNewMessageSendersAction();
}
@immutable
class GetNewMessageSendersSuccessAction extends redux.Action{
  const GetNewMessageSendersSuccessAction();
}

@immutable
class NextPageConversationsAction extends redux.Action{
  const NextPageConversationsAction();
}
@immutable
class NextPageConversationsSuccessAction extends redux.Action{
  final Iterable<User> users;  
  const NextPageConversationsSuccessAction({required this.users});
}
@immutable
class NextPageConversationsIfNoConversationsAction extends redux.Action{
  const NextPageConversationsIfNoConversationsAction();
}