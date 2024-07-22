import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:my_social_app/state/image_state.dart';

@immutable
class UserImageState{
  final int id;
  final Uint8List? image;
  final ImageState state;

  const UserImageState({
    required this.id,
    required this.image,
    required this.state
  });

  UserImageState startLoading(int id)
    => UserImageState(
        id: id,
        image: image,
        state: ImageState.started
      );

  UserImageState load(int id,Uint8List image)
    => UserImageState(
        id: id,
        image: image,
        state: ImageState.done
      );
}