import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/user_user_conversation_state/user_user_conversation_state.dart';

@immutable
class UserUserConversationActions extends AppAction{
  const UserUserConversationActions();
}

@immutable
class NextUserUserConversationsAction extends UserUserConversationActions{
  const NextUserUserConversationsAction();
}
@immutable
class NextUserUserConversationsSuccessAction extends UserUserConversationActions{
  final Iterable<UserUserConversationState> conversations;
  const NextUserUserConversationsSuccessAction({required this.conversations});
}
@immutable
class NextUserUserConversationsFailedAction extends UserUserConversationActions{
  const NextUserUserConversationsFailedAction();
}