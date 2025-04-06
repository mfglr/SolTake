import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/story_state/story_state.dart';
import 'package:my_social_app/views/shared/app_avatar/widgets/user_image_widget.dart';
import 'package:my_social_app/views/story/pages/display_story_page/display_story_page.dart';

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
    return Container(
      height: diameter,
      width: diameter,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: story.isViewed ? Colors.grey : Colors.deepPurple[400],
      ),
      child: UserImageWidget(
        image: story.image,
        diameter: diameter - 10,
        onPressed: () =>
          Navigator
            .of(context)
            .push(MaterialPageRoute(builder: (context) => DisplayStoryPage(userId: story.userId))),
      ),
    );
  }
}