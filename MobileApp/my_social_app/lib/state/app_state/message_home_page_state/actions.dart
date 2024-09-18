import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart';

@immutable
class GetNextPageConversationsIfNoPageAction extends AppAction{
  const GetNextPageConversationsIfNoPageAction();
}
@immutable
class GetNextPageConversationsIfNoReadyAction extends AppAction{
  const GetNextPageConversationsIfNoReadyAction();
}
@immutable
class GetNextPageConversationsAction extends AppAction{
  const GetNextPageConversationsAction();
}
@immutable
class AddNextPageConversationsAction extends AppAction{
  final Iterable<int> messageIds;  
  const AddNextPageConversationsAction({required this.messageIds});
}
