import 'package:flutter/material.dart';
import 'package:multimedia/models/multimedia.dart';
import 'package:my_social_app/models/avatar.dart';
import 'package:my_social_app/state/entity_state/base_entity.dart';

@immutable
class FollowedState extends BaseEntity<int> implements Avatar{
  final int followedId;
  final String userName;
  final String? name;
  final Multimedia? image;
  final bool isFollower;
  final bool isFollowed;

  FollowedState({
    required super.id,
    required this.followedId,
    required this.userName,
    required this.name,
    required this.image,
    required this.isFollower,
    required this.isFollowed
  });
  
  @override
  Multimedia? get avatar => image;
  @override
  int get avatarId => followedId;
}