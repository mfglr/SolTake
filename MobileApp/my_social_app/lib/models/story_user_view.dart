import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_social_app/custom_packages/media/models/multimedia.dart';
import 'package:my_social_app/state/story_state/story_user_view_state.dart';
part 'story_user_view.g.dart';

@immutable
@JsonSerializable()
class StoryUserView {
  final int id;
  final DateTime createdAt;
  final int userId;
  final String userName;
  final String? name;
  final Multimedia? image;

  const StoryUserView({
    required this.id,
    required this.createdAt,
    required this.userId,
    required this.userName,
    required this.name,
    required this.image
  });

  factory StoryUserView.fromJson(Map<String, dynamic> json) => _$StoryUserViewFromJson(json);
  Map<String, dynamic> toJson() => _$StoryUserViewToJson(this);


  StoryUserViewState toState() => 
    StoryUserViewState(
      id: id,
      userId: userId,
      userName: userName,
      name: name,
      image: image?.toMedia(),
      createdAt: createdAt
    );
}