import 'package:flutter/material.dart';
import 'package:multimedia/models/multimedia.dart';
import 'package:my_social_app/state/app_state/avatar.dart';
import 'package:my_social_app/state/entity_state/base_entity.dart';

@immutable
class FollowerState extends BaseEntity<int> implements Avatar {
  final int followerId;
  final String userName;
  final String? name;
  final Multimedia? image;
  final bool isFollower;
  final bool isFollowed;

  FollowerState({
    required super.id,
    required this.followerId,
    required this.userName,
    required this.name,
    required this.image,
    required this.isFollower,
    required this.isFollowed
  });
  
  @override
  Multimedia? get avatar => image;
  @override
  int get avatarId => followerId;
}