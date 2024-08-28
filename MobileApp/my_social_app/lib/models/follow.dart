import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_social_app/state/app_state/user_entity_state/followed_state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/follower_state.dart';
part "follow.g.dart";

@immutable
@JsonSerializable()
class Follow{
  final int id;
  final int followerId;
  final int followedId;
  final DateTime createdAt;

  const Follow({
    required this.id,
    required this.followerId,
    required this.followedId,
    required this.createdAt
  });

  factory Follow.fromJson(Map<String, dynamic> json) => _$FollowFromJson(json);
  Map<String, dynamic> toJson() => _$FollowToJson(this);

  FollowerState toFollowerState()
    => FollowerState(
        key: id,
        followerId: followerId,
        createdAt: createdAt
      );

  FollowedState toFollowedState()
    => FollowedState(
        key: id,
        followedId: followedId,
        createdAt: createdAt
      );
  
}