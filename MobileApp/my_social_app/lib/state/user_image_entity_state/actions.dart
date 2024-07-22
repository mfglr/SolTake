import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:my_social_app/state/user_image_entity_state/user_image_state.dart';
import 'package:my_social_app/state/actions.dart' as redux;

@immutable
class AddUserImageAction extends redux.Action{
  final UserImageState image;
  const AddUserImageAction({required this.image});
}

@immutable
class AddUserImagesAction extends redux.Action{
  final Iterable<UserImageState> images;
  const AddUserImagesAction({required this.images});
}

@immutable
class LoadUserImageAction extends redux.Action{
  final int userId;
  const LoadUserImageAction({required this.userId});
}

@immutable
class LoadUserImageSuccessAction extends redux.Action{
  final int userId;
  final Uint8List image;

  const LoadUserImageSuccessAction({
    required this.userId,
    required this.image
  });
}