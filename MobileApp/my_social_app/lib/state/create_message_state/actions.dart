import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:my_social_app/state/actions.dart' as redux;

@immutable
class CreateMessageAction extends redux.Action{
  const CreateMessageAction();
}

@immutable
class ChangeMessageContentAction extends redux.Action{
  final String content;
  const ChangeMessageContentAction({required this.content});
}

@immutable
class ChangeReceiverIdAction extends redux.Action{
  final int receiverId;
  const ChangeReceiverIdAction({required this.receiverId});
}

@immutable
class AddMessageImageAction extends redux.Action{
  final XFile image;
  const AddMessageImageAction({required this.image});
}

@immutable
class RemoveMessageImageAction extends redux.Action{
  final XFile image;
  const RemoveMessageImageAction({required this.image});
}