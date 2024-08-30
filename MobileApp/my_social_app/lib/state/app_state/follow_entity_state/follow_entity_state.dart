import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:my_social_app/state/entity_state/entity_state.dart';
import 'package:my_social_app/state/app_state/follow_entity_state/follow_state.dart';

@immutable
class FollowEntityState extends EntityState<FollowState>{
  const FollowEntityState({required super.containers});
  
  FollowEntityState addFollows(Iterable<FollowState> follows) => FollowEntityState(containers: appendMany(follows));
  FollowEntityState addFollow(FollowState follow) => FollowEntityState(containers: appendOne(follow));
  FollowEntityState removeFollow(int id) => FollowEntityState(containers: removeOne(id));

  FollowState? select(int followerId,int followedId)
    => containers.values.firstWhereOrNull((e) => e.entity.followerId == followerId && e.entity.followedId == followedId)?.entity;
}