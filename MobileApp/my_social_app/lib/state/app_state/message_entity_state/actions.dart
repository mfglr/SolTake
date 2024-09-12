import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart' as redux;
import 'package:my_social_app/state/app_state/message_entity_state/message_state.dart';

@immutable
class LoadMessageAction extends redux.Action{
  final int messageId;
  const LoadMessageAction({required this.messageId});
}

@immutable
class AddMessageAction extends redux.Action{
  final MessageState message;
  const AddMessageAction({required this.message});
}
@immutable
class AddMessagesAction extends redux.Action{
  final Iterable<MessageState> messages;
  const AddMessagesAction({required this.messages});
}
@immutable
class AddMessagesListsAction extends redux.Action{
  final Iterable<Iterable<MessageState>> lists;
  const AddMessagesListsAction({required this.lists});
}
@immutable
class RemoveMessageAction extends redux.Action{
  final int messageId;
  const RemoveMessageAction({required this.messageId});
}
@immutable
class RemoveMessageSuccessAction extends redux.Action{
  final int messageId;
  const RemoveMessageSuccessAction({required this.messageId});
}
@immutable
class RemoveMessagesAction extends redux.Action{
  final int userId;
  final Iterable<int> messageIds;
  const RemoveMessagesAction({required this.userId, required this.messageIds});
}
@immutable
class RemoveMessagesSuccessAction extends redux.Action{
  final Iterable<int> messageIds;
  const RemoveMessagesSuccessAction({required this.messageIds});
}

@immutable
class GetUnviewedMessagesAction extends redux.Action{
  const GetUnviewedMessagesAction();
}

@immutable
class MarkComingMessageAsReceivedAction extends redux.Action{
  final int messageId;
  const MarkComingMessageAsReceivedAction({required this.messageId});
}
@immutable
class MarkComingMessagesAsReceivedAction extends redux.Action{
  const MarkComingMessagesAsReceivedAction();
}
@immutable
class MarkComingMessagesAsReceivedSuccessAction extends redux.Action{
  final Iterable<int> messageIds;
  const MarkComingMessagesAsReceivedSuccessAction({required this.messageIds});
}

@immutable
class MarkComingMessageAsViewedAction extends redux.Action{
  final int messageId;
  const MarkComingMessageAsViewedAction({required this.messageId});
}
@immutable
class MarkComingMessagesAsViewedAction extends redux.Action{
  final int userId;
  const MarkComingMessagesAsViewedAction({required this.userId});
}
@immutable
class MarkComingMessagesAsViewedSuccessAction extends redux.Action{
  final Iterable<int> messageIds;
  const MarkComingMessagesAsViewedSuccessAction({required this.messageIds});
}

@immutable
class MarkOutgoingMessageAsReceivedAction extends redux.Action{
  final MessageState message;
  const MarkOutgoingMessageAsReceivedAction({required this.message});
}
@immutable
class MarkOutgoingMessageAsViewedAction extends redux.Action{
  final MessageState message;
  const MarkOutgoingMessageAsViewedAction({required this.message});
}