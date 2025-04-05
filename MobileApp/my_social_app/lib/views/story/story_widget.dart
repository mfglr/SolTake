import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/story_state/story_state.dart';
import 'package:my_social_app/views/shared/app_avatar/widgets/user_image_widget.dart';

class StoryWidget extends StatelessWidget {
  final StoryState story;
  final double diameter;
  const StoryWidget({
    super.key,
    required this.story,
    required this.diameter
  });

  @override
  Widget build(BuildContext context) {
    return UserImageWidget(
      image: story.image,
      diameter: diameter
    );
  }
}