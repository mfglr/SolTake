import 'package:flutter/material.dart';
import 'package:my_social_app/state/story_state/story_state.dart';
import 'package:my_social_app/views/shared/app_avatar/widgets/user_image_widget.dart';
import 'package:my_social_app/views/shared/app_date_widget.dart';

class StoryUserHeader extends StatelessWidget {
  final StoryState story;
  const StoryUserHeader({
    super.key,
    required this.story
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Container(
        //   margin: const EdgeInsets.only(right: 5),
        //   child: UserImageWidget(
        //     image: story.image,
        //     diameter: 50
        //   ),
        // ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              story.userName,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic
              ),
            ),
            AppDateWidget(dateTime: story.createdAt)
          ],
        )
      ],
    );
  }
}