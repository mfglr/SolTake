import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart' as redux;

@immutable
class GetNextPageConversationsIfNoPageAction extends redux.Action{
  const GetNextPageConversationsIfNoPageAction();
}
@immutable
class GetNextPageConversationsIfNoReadyAction extends redux.Action{
  const GetNextPageConversationsIfNoReadyAction();
}
@immutable
class GetNextPageConversationsAction extends redux.Action{
  const GetNextPageConversationsAction();
}
@immutable
class AddNextPageConversationsAction extends redux.Action{
  final Iterable<int> messageIds;  
  const AddNextPageConversationsAction({required this.messageIds});
}
