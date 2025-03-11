import 'package:flutter/material.dart';
import 'package:multimedia/models/multimedia.dart';
import 'package:my_social_app/models/avatar.dart';
import 'package:my_social_app/state/entity_state/base_entity.dart';

@immutable
class CommentUserLikeState extends BaseEntity<int> implements Avatar{
  final int userId;
  final String userName;
  final String? name;
  final Multimedia? image;
  
  CommentUserLikeState({
    required super.id,
    required this.userId,
    required this.userName,
    required this.name,
    required this.image
  });
  
  @override
  Multimedia? get avatar => image;
  @override
  int get avatarId => userId;
}