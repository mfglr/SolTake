import 'package:flutter/material.dart';

@immutable
class FollowState{
  final int id;
  final DateTime createdAt;
  final int followerId;
  final int followedId;

  const FollowState({
    required this.id,
    required this.createdAt,
    required this.followerId,
    required this.followedId
  });
}