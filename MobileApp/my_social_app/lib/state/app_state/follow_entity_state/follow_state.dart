import 'package:flutter/material.dart';
import 'package:my_social_app/state/entity_state/has_id.dart';

@immutable
class FollowState extends HasId<num>{
  final DateTime createdAt;
  final int followerId;
  final int followedId;

  FollowState({
    required super.id,
    required this.createdAt,
    required this.followerId,
    required this.followedId
  });
}