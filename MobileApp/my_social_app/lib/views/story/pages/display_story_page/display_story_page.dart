import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/story_state/selectors.dart';
import 'package:my_social_app/state/app_state/story_state/story_state.dart';
import 'package:my_social_app/views/story/pages/display_story_page/widgets/stories.dart';

class DisplayStoryPage extends StatelessWidget {
  final int userId;
  const DisplayStoryPage({
    super.key,
    required this.userId
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoreConnector<AppState,Iterable<Iterable<StoryState>>>(
        converter: (store) => selectAllStories(store),
        builder: (context,stories) => Stories(
          userStories: stories,
          userId: userId
        ),
      ),
    );
  }
}