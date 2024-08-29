import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_social_app/models/user.dart';
import 'package:my_social_app/state/app_state/follow_entity_state/follow_state.dart';
part "follow.g.dart";

@immutable
@JsonSerializable()
class Follow{
  final int id;
  final int followerId;
  final int followedId;
  final DateTime createdAt;
  final User? follower;
  final User? followed;

  const Follow({
    required this.id,
    required this.followerId,
    required this.followedId,
    required this.createdAt,
    required this.follower,
    required this.followed
  });

  factory Follow.fromJson(Map<String, dynamic> json) => _$FollowFromJson(json);
  Map<String, dynamic> toJson() => _$FollowToJson(this);
  
  FollowState toFollowState()
    => FollowState(
        id: id,
        createdAt: createdAt,
        followerId: followerId,
        followedId: followedId
      );

}