import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:multimedia/models/multimedia.dart';
import 'package:my_social_app/state/app_state/user_entity_state/user_story_state.dart';
part "user_story.g.dart";

@JsonSerializable()
@immutable
class UserStory{
  final int id;
  final DateTime createdAt;
  final bool isViewed;
  final Multimedia media;

  const UserStory({
    required this.id,
    required this.createdAt,
    required this.isViewed,
    required this.media
  });

  factory UserStory.fromJson(Map<String, dynamic> json) => _$UserStoryFromJson(json);
  Map<String, dynamic> toJson() => _$UserStoryToJson(this);

  UserStoryState toState() => 
    UserStoryState(
      id: id,
      createdAt: createdAt,
      isViewed: isViewed,
      media: media
    );
}