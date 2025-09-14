import 'package:flutter/material.dart';
import 'package:my_social_app/state/story_state/story_circle_state.dart';
import 'package:my_social_app/views/story/widgets/story_circle_widget.dart';

class StoryCirclesWidget extends StatelessWidget {
  final Iterable<StoryCircleState> storyCircles;
  const StoryCirclesWidget({
    super.key,
    required this.storyCircles
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: 
        storyCircles
          .map((storyCircle) => Container(
            margin: const EdgeInsets.only(right: 5),
            child: StoryCircleWidget(storyCircle: storyCircle, diameter: 80)
          ))
          .toList(),
    );
  }
}