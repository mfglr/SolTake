import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart' as redux;
import 'package:my_social_app/state/app_state/message_image_entity_state/message_image_state.dart';

@immutable
class AddMessageImageAction extends redux.Action{
  final MessageImageState image;
  const AddMessageImageAction({required this.image});
}
@immutable
class AddMessageImagesAction extends redux.Action{
  final Iterable<MessageImageState> images;
  const AddMessageImagesAction({required this.images});
}
@immutable
class AddMessageImagesListAction extends redux.Action{
  final Iterable<Iterable<MessageImageState>> list;
  const AddMessageImagesListAction({required this.list});
}

@immutable
class LoadMessageImageAction extends redux.Action{
  final int messageId;
  final int index;
  const LoadMessageImageAction({required this.messageId,required this.index});
}
@immutable
class LoadMessageImageSuccessAction extends redux.Action{
  final int messageId;
  final int index;
  final Uint8List image;
  const LoadMessageImageSuccessAction({required this.messageId, required this.index, required this.image});
}