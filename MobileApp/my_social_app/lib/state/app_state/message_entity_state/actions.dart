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
class CreateMessageWithMediasAction extends AppAction{
  final String id;
  final int receiverId;
  final String? content;
  final Iterable<AppFile> medias;
  const CreateMessageWithMediasAction({
    required this.id,
    required this.receiverId,
    required this.content,
    required this.medias
  });
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
class MarkMessagesAsReceivedAction extends AppAction{
  final Iterable<int> messageIds;
  const MarkMessagesAsReceivedAction({required this.messageIds});
}

@immutable
class MarkMessagesAsReceivedSuccessAction extends AppAction{
  final Iterable<int> messageIds;
  const MarkMessagesAsReceivedSuccessAction({required this.messageIds});
}

@immutable
class MarkMessageAsViewedAction extends AppAction{
  final int messageId;
  const MarkMessageAsViewedAction({required this.messageId});
}

@immutable
class MarkMessagesAsViewedAction extends AppAction{
  final Iterable<int> messageIds;
  const MarkMessagesAsViewedAction({required this.messageIds});
}

@immutable
class MarkMessagesAsViewedSuccessAction extends AppAction{
  final Iterable<int> messageIds;
  const MarkMessagesAsViewedSuccessAction({required this.messageIds});
}
