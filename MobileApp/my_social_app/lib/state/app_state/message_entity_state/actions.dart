import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart' as redux;
import 'package:my_social_app/state/app_state/message_entity_state/message_state.dart';

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

@immutable
class LoadMessageImageAction extends redux.Action{
  final int messageId;
  final int messageImageId;
  const LoadMessageImageAction({required this.messageId, required this.messageImageId});
}
@immutable
class LoadMessageImageSuccessAction extends redux.Action{
  final int messageId;
  final int messageImageId;
  final Uint8List image;
  const LoadMessageImageSuccessAction({
    required this.messageId,
    required this.messageImageId,
    required this.image
  });
}