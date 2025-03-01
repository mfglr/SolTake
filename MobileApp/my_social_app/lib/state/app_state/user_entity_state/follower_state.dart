import 'package:flutter/material.dart';
import 'package:multimedia/models/multimedia.dart';
import 'package:my_social_app/state/entity_state/base_entity.dart';

@immutable
class FollowerState extends BaseEntity<int> {
  final int followerId;
  final String userName;
  final String? name;
  final Multimedia? image;

  FollowerState({
    required super.id,
    required this.followerId,
    required this.userName,
    required this.name,
    required this.image
  });
}