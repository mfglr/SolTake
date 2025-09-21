import 'package:flutter/material.dart';
import 'package:my_social_app/custom_packages/media/models/media.dart';
import 'package:my_social_app/state/user_item.dart';

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
  Media? get avatar => image;
  @override
  int get avatarId => userId;
}