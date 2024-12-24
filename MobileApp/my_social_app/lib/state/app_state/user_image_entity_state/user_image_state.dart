import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:multimedia_state/multimedia_state.dart';

@immutable
class UserImageState{
  final int id;
  final Uint8List? image;
  final MultimediaStatus state;

  const UserImageState({
    required this.id,
    required this.image,
    required this.state
  });

  factory UserImageState.init(int userId) => UserImageState(id: userId, image: null, state: MultimediaStatus.started); //check this row

  UserImageState load(Uint8List image)
    => UserImageState(
        id: id,
        image: image,
        state: MultimediaStatus.done
      );
}