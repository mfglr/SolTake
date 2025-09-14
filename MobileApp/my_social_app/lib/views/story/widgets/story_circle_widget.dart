import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/helpers/string_helpers.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/story_state/selectors.dart';
import 'package:my_social_app/state/story_state/story_circle_state.dart';
import 'package:my_social_app/views/shared/app_avatar/widgets/user_image_widget.dart';
import 'package:my_social_app/views/story/pages/display_story_page/display_story_page.dart';

class StoryCircleWidget extends StatelessWidget {
  final StoryCircleState storyCircle;
  final double diameter;
  const StoryCircleWidget({
    super.key,
    required this.storyCircle,
    required this.diameter
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Container(
        //   height: diameter,
        //   width: diameter,
        //   decoration: BoxDecoration(
        //     shape: BoxShape.circle,
        //     color: storyCircle.isViewed ? Colors.grey : Colors.deepPurple[400],
        //   ),
        //   child: UserImageWidget(
        //     image: storyCircle.image,
        //     diameter: diameter - 10,
        //     onPressed: (){
        //       final store = StoreProvider.of<AppState>(context,listen: false);
        //       final userStories = selectAllStories(store);
        //       Navigator
        //         .of(context)
        //         .push(
        //           MaterialPageRoute(
        //             builder: (context) => DisplayStoryPage(
        //               userId: storyCircle.userId,
        //               userStories: userStories
        //             )
        //           )
        //         );
        //     }
        //   ),
        // ),
        Text(
          compressText(storyCircle.userName, 10),
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold
          ),
        )
      ],
    );
  }
}