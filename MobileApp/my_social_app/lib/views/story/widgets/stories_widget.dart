import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/story_state/story_state.dart';
import 'package:my_social_app/views/story/widgets/story_widget.dart';

class StoriesWidget extends StatelessWidget {
  final Iterable<StoryState> stories;
  const StoriesWidget({
    super.key,
    required this.stories
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: 
        stories
          .map((story) => Container(
            margin: const EdgeInsets.only(right: 5),
            child: StoryWidget(story: story, diameter: 80)
          ))
          .toList(),
    );
  }
}