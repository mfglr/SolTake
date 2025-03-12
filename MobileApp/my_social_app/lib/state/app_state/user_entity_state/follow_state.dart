import 'package:flutter/material.dart';
import 'package:multimedia/models/multimedia.dart';
import 'package:my_social_app/state/app_state/user_item.dart';

@immutable
class FollowState extends UserItem{
  final bool isFollower;
  final bool isFollowed;

  FollowState({
    required super.id,
    required super.userId,
    required super.userName,
    required super.name,
    required super.image,
    required this.isFollower,
    required this.isFollowed
  });
  
  @override
  Multimedia? get avatar => image;
  @override
  int get avatarId => userId;
}