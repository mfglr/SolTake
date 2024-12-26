import 'package:app_file/app_file.dart';
import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/message_entity_state/message_state.dart';

@immutable
class CreateMessageAction extends AppAction{
  final int receiverId;
  final String content;
  const CreateMessageAction({required this.receiverId, required this.content});
}

@immutable
class CreateMessageWithImagesAction extends AppAction{
  final int receiverId;
  final String? content;
  final Iterable<AppFile> images;
  const CreateMessageWithImagesAction({required this.receiverId, required this.content, required this.images});
}


@immutable
class LoadMessageAction extends AppAction{
  final int messageId;
  const LoadMessageAction({required this.messageId});
}

@immutable
class AddMessageAction extends AppAction{
  final MessageState message;
  const AddMessageAction({required this.message});
}
@immutable
class AddMessagesAction extends AppAction{
  final Iterable<MessageState> messages;
  const AddMessagesAction({required this.messages});
}
@immutable
class AddMessagesListsAction extends AppAction{
  final Iterable<Iterable<MessageState>> lists;
  const AddMessagesListsAction({required this.lists});
}
@immutable
class RemoveMessageAction extends AppAction{
  final int messageId;
  const RemoveMessageAction({required this.messageId});
}
@immutable
class RemoveMessageSuccessAction extends AppAction{
  final int messageId;
  const RemoveMessageSuccessAction({required this.messageId});
}
@immutable
class RemoveMessagesAction extends AppAction{
  final int userId;
  final Iterable<int> messageIds;
  const RemoveMessagesAction({required this.userId, required this.messageIds});
}
@immutable
class RemoveMessagesSuccessAction extends AppAction{
  final Iterable<int> messageIds;
  const RemoveMessagesSuccessAction({required this.messageIds});
}
@immutable
class RemoveMessagesByUserIdsAction extends AppAction{
  final Iterable<int> userIds;
  const RemoveMessagesByUserIdsAction({required this.userIds});
}
@immutable
class RemoveMessagesByUserIdsSuccessAction extends AppAction{
  final Iterable<int> userIds;
  const RemoveMessagesByUserIdsSuccessAction({required this.userIds});
}

@immutable
class GetUnviewedMessagesAction extends AppAction{
  const GetUnviewedMessagesAction();
}

@immutable
class MarkComingMessageAsReceivedAction extends AppAction{
  final int messageId;
  const MarkComingMessageAsReceivedAction({required this.messageId});
}
@immutable
class MarkComingMessagesAsReceivedAction extends AppAction{
  const MarkComingMessagesAsReceivedAction();
}
@immutable
class MarkComingMessagesAsReceivedSuccessAction extends AppAction{
  final Iterable<int> messageIds;
  const MarkComingMessagesAsReceivedSuccessAction({required this.messageIds});
}

@immutable
class MarkComingMessageAsViewedAction extends AppAction{
  final int messageId;
  const MarkComingMessageAsViewedAction({required this.messageId});
}
@immutable
class MarkComingMessagesAsViewedAction extends AppAction{
  final int userId;
  const MarkComingMessagesAsViewedAction({required this.userId});
}
@immutable
class MarkComingMessagesAsViewedSuccessAction extends AppAction{
  final Iterable<int> messageIds;
  const MarkComingMessagesAsViewedSuccessAction({required this.messageIds});
}

@immutable
class MarkOutgoingMessageAsReceivedAction extends AppAction{
  final MessageState message;
  const MarkOutgoingMessageAsReceivedAction({required this.message});
}
@immutable
class MarkOutgoingMessageAsViewedAction extends AppAction{
  final MessageState message;
  const MarkOutgoingMessageAsViewedAction({required this.message});
}