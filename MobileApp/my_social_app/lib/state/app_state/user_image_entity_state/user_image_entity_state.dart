import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:my_social_app/state/entity_state/entity_state.dart';
import 'package:my_social_app/state/app_state/user_image_entity_state/user_image_state.dart';

@immutable
class UserImageEntityState extends EntityState<UserImageState>{
  const UserImageEntityState({required super.containers});

  UserImageEntityState addValue(UserImageState value)
    => UserImageEntityState(containers: appendOne(value));

  UserImageEntityState addVaues(Iterable<UserImageState> values)
    => UserImageEntityState(containers: appendMany(values));
 
  UserImageEntityState load(int id,Uint8List image)
    => UserImageEntityState(containers: updateOne(containers[id]!.entity.load(image)));
}