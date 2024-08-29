import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/entity_state.dart';
import 'package:my_social_app/state/app_state/follow_entity_state/follow_state.dart';

@immutable
class FollowEntityState extends EntityState<FollowState>{
  const FollowEntityState({required super.entities});
  
  FollowEntityState addFollows(Iterable<FollowState> follows) => FollowEntityState(entities: appendMany(follows));
  FollowEntityState addFollow(FollowState follow) => FollowEntityState(entities: appendOne(follow));
  FollowEntityState removeFollow(int id) => FollowEntityState(entities: removeOne(id));

  FollowState? select(int followerId,int followedId)
    => entities.values.firstWhereOrNull((e) => e.followerId == followerId && e.followedId == followedId);
}