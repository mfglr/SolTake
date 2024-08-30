import 'package:flutter/material.dart';
import 'package:my_social_app/state/entity_state/entity.dart';

@immutable
class FollowState extends Entity{
  final DateTime createdAt;
  final int followerId;
  final int followedId;

  const FollowState({
    required super.id,
    required this.createdAt,
    required this.followerId,
    required this.followedId
  });
}