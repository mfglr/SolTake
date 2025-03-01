import 'package:flutter/material.dart';
import 'package:multimedia/models/multimedia.dart';
import 'package:my_social_app/state/entity_state/base_entity.dart';

@immutable
class FollowedState extends BaseEntity<int>{
  final int followedId;
  final String userName;
  final String? name;
  final Multimedia? image;

  FollowedState({
    required super.id,
    required this.followedId,
    required this.userName,
    required this.name,
    required this.image
  });
}