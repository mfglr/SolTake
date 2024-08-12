import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:my_social_app/state/image_status.dart';

@immutable
class UserImageState{
  final int id;
  final Uint8List? image;
  final ImageStatus state;

  const UserImageState({
    required this.id,
    required this.image,
    required this.state
  });

  factory UserImageState.init(int userId) => UserImageState(id: userId, image: null, state: ImageStatus.notStarted);

  UserImageState load(Uint8List image)
    => UserImageState(
        id: id,
        image: image,
        state: ImageStatus.done
      );
}