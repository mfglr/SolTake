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