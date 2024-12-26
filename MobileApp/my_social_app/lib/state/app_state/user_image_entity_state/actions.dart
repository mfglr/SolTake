import 'dart:typed_data';
import 'package:app_file/app_file.dart';
import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/user_image_entity_state/user_image_state.dart';


@immutable
class UpdateUserImageAction extends AppAction{
  final int userId;
  final AppFile file;
  const UpdateUserImageAction({required this.userId, required this.file});
}

@immutable
class RemoveCurrentUserImageAction extends AppAction{
  const RemoveCurrentUserImageAction();
}

@immutable
class AddUserImageAction extends AppAction{
  final UserImageState image;
  const AddUserImageAction({required this.image});
}

@immutable
class AddUserImagesAction extends AppAction{
  final Iterable<UserImageState> images;
  const AddUserImagesAction({required this.images});
}

@immutable
class LoadUserImageAction extends AppAction{
  final int userId;
  const LoadUserImageAction({required this.userId});
}

@immutable
class LoadUserImageSuccessAction extends AppAction{
  final int userId;
  final Uint8List image;

  const LoadUserImageSuccessAction({
    required this.userId,
    required this.image
  });
}