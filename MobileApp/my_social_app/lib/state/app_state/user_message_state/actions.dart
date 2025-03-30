import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart';

@immutable
class UserMessageAction extends AppAction{
  const UserMessageAction();
}

@immutable
class NextUserMessagesAction extends UserMessageAction{
  final int userId;
  const NextUserMessagesAction({required this.userId});
}
@immutable
class NextUserMessagesSuccessAction extends UserMessageAction{
  final int userId;
  final Iterable<int> messageIds;
  const NextUserMessagesSuccessAction({required this.userId, required this.messageIds});
}
@immutable
class NextUserMessagesFailedAction extends UserMessageAction{
  final int userId;
  const NextUserMessagesFailedAction({required this.userId});
}

@immutable
class AddUserMessageAction extends UserMessageAction{
  final int userId;
  final int messageId;
  const AddUserMessageAction({required this.userId, required this.messageId});
}

@immutable
class RemoveUserMessagesAction extends UserMessageAction{
  final int userId;
  final Iterable<int> messageIds;
  const RemoveUserMessagesAction({required this.userId, required this.messageIds});
}