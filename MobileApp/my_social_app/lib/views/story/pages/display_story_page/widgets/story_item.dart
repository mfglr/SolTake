import 'package:flutter/material.dart';
import 'package:multimedia/models/multimedia_type.dart';
import 'package:my_social_app/state/app_state/story_state/story_state.dart';
import 'package:my_social_app/views/story/pages/display_story_page/widgets/story_image_item.dart';
import 'package:my_social_app/views/story/pages/display_story_page/widgets/story_video_item.dart';

class StoryItem extends StatelessWidget {
  final StoryState story;
  final int index;
  final int numberOfItems;
  final String notFoundImagePath;
  final String baseUrl;
  final void Function() next;
  final void Function() prev;

  const StoryItem({
    super.key,
    required this.notFoundImagePath,
    required this.story,
    required this.index,
    required this.numberOfItems,
    required this.next,
    required this.prev,
    required this.baseUrl
  });

  @override
  Widget build(BuildContext context) {
    return story.media.multimediaType == MultimediaType.video
      ? StoryVideoItem(
          story: story,
          index: index,
          numberOfItems: numberOfItems,
          next: next,
          prev: prev,
          baseUrl: baseUrl
        )
      : StoryImageItem(
          story: story,
          baseUrl: baseUrl,
          notFoundImagePath: notFoundImagePath,
          numberOfItems: numberOfItems,
          index: index,
          next: next,
          prev: prev
        );
  }
}