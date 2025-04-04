import 'package:flutter/material.dart';
import 'package:multimedia/models/multimedia.dart';
import 'package:my_social_app/state/app_state/story_state/story_user_view_state.dart';
import 'package:my_social_app/state/entity_state/base_entity.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';

@immutable
class StoryState extends BaseEntity<int>{
  final int userId;
  final String userName;
  final Multimedia? image;
  final Multimedia media;
  final Pagination<int,StoryUserViewState> viwes;

  StoryState({
    required super.id,
    required this.userId,
    required this.userName,
    required this.image,
    required this.media,
    required this.viwes
  });

}