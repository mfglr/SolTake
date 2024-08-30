import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/image_status.dart';
import 'package:my_social_app/state/entity_state/entity.dart';

@immutable
class UserImageState extends Entity{
  final Uint8List? image;
  final ImageStatus state;

  const UserImageState({
    required super.id,
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