import 'package:flutter/material.dart';
import 'package:my_social_app/state/story_state/story_state.dart';
import 'package:my_social_app/views/story/pages/display_story_user_views_page/display_story_user_views_page.dart';

class DisplayStoryViewersButton extends StatelessWidget {
  final StoryState story;
  final void Function() play;
  final void Function() pause;
  const DisplayStoryViewersButton({
    super.key,
    required this.story,
    required this.play,
    required this.pause
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (){
        pause();
        Navigator
          .of(context)
          .push(MaterialPageRoute(builder: (context) => DisplayStoryUserViewsPage(storyId: story.id)))
          .then((_) => play());
      },
      icon: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 5),
            child: const Icon(Icons.remove_red_eye_sharp)
          ),
          Text("${story.numberOfViewers}")
        ],
      )
    );  
  }
}