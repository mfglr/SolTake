import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/message_image_entity_state/message_image_state.dart';

@immutable
class AddMessageImageAction extends AppAction{
  final MessageImageState image;
  const AddMessageImageAction({required this.image});
}
@immutable
class AddMessageImagesAction extends AppAction{
  final Iterable<MessageImageState> images;
  const AddMessageImagesAction({required this.images});
}
@immutable
class AddMessageImagesListAction extends AppAction{
  final Iterable<Iterable<MessageImageState>> list;
  const AddMessageImagesListAction({required this.list});
}
@immutable
class RemoveMessageImagesAction extends AppAction{
  final int messageId;
  const RemoveMessageImagesAction({required this.messageId});
}
@immutable
class RemoveMessagesImagesAction extends AppAction{
  final Iterable<int> messageIds;
  const RemoveMessagesImagesAction({required this.messageIds});
}

@immutable
class LoadMessageImageAction extends AppAction{
  final int messageId;
  final int index;
  const LoadMessageImageAction({required this.messageId,required this.index});
}
@immutable
class LoadMessageImageSuccessAction extends AppAction{
  final int messageId;
  final int index;
  final Uint8List image;
  const LoadMessageImageSuccessAction({required this.messageId, required this.index, required this.image});
}