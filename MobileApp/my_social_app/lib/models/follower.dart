import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:multimedia/models/multimedia.dart';
import 'package:my_social_app/state/app_state/user_entity_state/follower_state.dart';
part 'follower.g.dart';

@immutable
@JsonSerializable()
class Follower{
  final int id;
  final int followerId;
  final String userName;
  final String? name;
  final Multimedia? image;

  const Follower({
    required this.id,
    required this.followerId,
    required this.userName,
    required this.name,
    required this.image
  });

  factory Follower.fromJson(Map<String, dynamic> json) => _$FollowerFromJson(json);
  Map<String, dynamic> toJson() => _$FollowerToJson(this);
  
  FollowerState toFollowerState()
    => FollowerState(
        id: id,
        followerId: followerId,
        userName: userName,
        name: name,
        image: image
      );
}