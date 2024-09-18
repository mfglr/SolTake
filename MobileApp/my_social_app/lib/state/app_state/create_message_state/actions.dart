import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart';

@immutable
class CreateMessageWithImagesAction extends AppAction{
  const CreateMessageWithImagesAction();
}
@immutable
class CreateMessageAction extends AppAction{
  const CreateMessageAction();
}

@immutable
class ClearMessageContentAndImagesAction extends AppAction{
  const ClearMessageContentAndImagesAction();
}
@immutable
class ChangeMessageContentAction extends AppAction{
  final String content;
  const ChangeMessageContentAction({required this.content});
}
@immutable
class ChangeReceiverIdAction extends AppAction{
  final int receiverId;
  const ChangeReceiverIdAction({required this.receiverId});
}
@immutable
class CreateMessageImagesAction extends AppAction{
  final Iterable<XFile> images;
  const CreateMessageImagesAction({required this.images});
}
@immutable
class AddMessageImageAction extends AppAction{
  final XFile image;
  const AddMessageImageAction({required this.image});
}
@immutable
class RemoveMessageImageAction extends AppAction{
  final XFile image;
  const RemoveMessageImageAction({required this.image});
}