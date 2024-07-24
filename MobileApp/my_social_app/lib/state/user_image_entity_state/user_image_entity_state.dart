import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:my_social_app/state/entity_state.dart';
import 'package:my_social_app/state/user_image_entity_state/user_image_state.dart';

@immutable
class UserImageEntityState extends EntityState<UserImageState>{
  const UserImageEntityState({required super.entities});

  UserImageEntityState addValue(UserImageState value)
    => UserImageEntityState(entities: appendOne(value));

  UserImageEntityState addVaues(Iterable<UserImageState> values)
    => UserImageEntityState(entities: appendMany(values));
 
  UserImageEntityState load(int id,Uint8List image)
    => UserImageEntityState(entities: updateOne(entities[id]!.load(id, image)));
}