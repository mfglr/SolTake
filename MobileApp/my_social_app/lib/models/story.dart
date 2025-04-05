import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:multimedia/models/multimedia.dart';
import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/state/app_state/story_state/story_state.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';
part 'story.g.dart';

@immutable
@JsonSerializable()
class Story {
  final int id;
  final int userId;
  final String userName;
  final Multimedia? image;
  final Multimedia media;

  const Story({
    required this.id,
    required this.userId,
    required this.userName,
    required this.image,
    required this.media
  });

  factory Story.fromJson(Map<String, dynamic> json) => _$StoryFromJson(json);
  Map<String, dynamic> toJson() => _$StoryToJson(this);

  StoryState toStoryState() =>
    StoryState(
      id: id,
      userId: userId,
      userName: userName,
      image: image,
      media: media,
      viwes: Pagination.init(usersPerPage, true)
    );
}