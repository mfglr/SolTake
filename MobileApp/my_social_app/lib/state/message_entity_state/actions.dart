import 'package:flutter/material.dart';
import 'package:my_social_app/state/actions.dart' as redux;
import 'package:my_social_app/state/message_entity_state/message_state.dart';

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
class AddReceiverToMessagesReceivedAction extends redux.Action{
  const AddReceiverToMessagesReceivedAction();
}
@immutable
class AddReceiverToMessagesSuccessAction extends redux.Action{
  final Iterable<int> messageIds;
  final int receiverId;
  const AddReceiverToMessagesSuccessAction({required this.messageIds,required this.receiverId});
}


@immutable
class AddViewerToMessagesReceivedAction extends redux.Action{
  final int userId;
  const AddViewerToMessagesReceivedAction({required this.userId});
}
@immutable
class AddViewerToMessagesSuccessAction extends redux.Action{
  final Iterable<int> messageIds;
  final int viewerId;
  const AddViewerToMessagesSuccessAction({required this.messageIds, required this.viewerId});
}