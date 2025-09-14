import 'package:flutter/material.dart';
import 'package:my_social_app/state/actions.dart';
import 'package:my_social_app/state/user_user_conversation_state/user_user_conversation_state.dart';

@immutable
class UserUserConversationAction extends AppAction{
  const UserUserConversationAction();
}

@immutable
class RemoveUserUserConversationAction extends UserUserConversationAction{
  final int userId;
  const RemoveUserUserConversationAction({required this.userId});
}

@immutable
class NextUserUserConversationsAction extends UserUserConversationAction{
  const NextUserUserConversationsAction();
}
@immutable
class NextUserUserConversationsSuccessAction extends UserUserConversationAction{
  final Iterable<UserUserConversationState> conversations;
  const NextUserUserConversationsSuccessAction({required this.conversations});
}
@immutable
class NextUserUserConversationsFailedAction extends UserUserConversationAction{
  const NextUserUserConversationsFailedAction();
}

@immutable
class FirstUserUserConversationsAction extends UserUserConversationAction{
  const FirstUserUserConversationsAction();
}
@immutable
class FirstUserUserConversationsSuccessAction extends UserUserConversationAction{
  final Iterable<UserUserConversationState> conversations;
  const FirstUserUserConversationsSuccessAction({required this.conversations});
}
@immutable
class FirstUserUserConversationsFailedAction extends UserUserConversationAction{
  const FirstUserUserConversationsFailedAction();
}