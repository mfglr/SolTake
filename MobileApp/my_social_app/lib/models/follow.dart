import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_social_app/packages/media/models/multimedia.dart';
import 'package:my_social_app/state/follows_state/follow_state.dart';
part 'follow.g.dart';

@JsonSerializable()
@immutable
class Follow {
  final int id;
  final int userId;
  final String userName;
  final String? name;
  final Multimedia? image;
  final bool isFollower;
  final bool isFollowed;

  const Follow({
    required this.id,
    required this.userId,
    required this.userName,
    required this.name,
    required this.image,
    required this.isFollower,
    required this.isFollowed
  });

  factory Follow.fromJson(Map<String, dynamic> json) => _$FollowFromJson(json);
  Map<String, dynamic> toJson() => _$FollowToJson(this);

  FollowState toFollowState()
    => FollowState(
        id: id,
        userId: userId,
        userName: userName,
        name: name,
        image: image,
        isFollower: isFollower,
        isFollowed: isFollowed
      );
}