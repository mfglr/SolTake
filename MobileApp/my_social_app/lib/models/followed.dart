import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:multimedia/models/multimedia.dart';
import 'package:my_social_app/state/app_state/user_entity_state/followed_state.dart';
part 'followed.g.dart';

@JsonSerializable()
@immutable
class Followed {
  final int id;
  final int followedId;
  final String userName;
  final String? name;
  final Multimedia? image;

  const Followed({
    required this.id,
    required this.followedId,
    required this.userName,
    required this.name,
    required this.image
  });

  factory Followed.fromJson(Map<String, dynamic> json) => _$FollowedFromJson(json);
  Map<String, dynamic> toJson() => _$FollowedToJson(this);

  FollowedState toFollowedState()
    => FollowedState(
        id: id,
        followedId: followedId,
        userName: userName,
        name: name,
        image: image
      );
}