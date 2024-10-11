import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart';

@immutable
class NextConversationsAction extends AppAction{
  const NextConversationsAction();
}
@immutable
class NextConversationsSuccessAction extends AppAction{
  final Iterable<int> messageIds;  
  const NextConversationsSuccessAction({required this.messageIds});
}
@immutable
class NextConversationsFailedAction extends AppAction{
  const NextConversationsFailedAction();
}