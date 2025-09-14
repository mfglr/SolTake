import 'package:flutter/material.dart';
import 'package:my_social_app/state/story_state/story_user_view_state.dart';
import 'package:my_social_app/views/shared/app_column.dart';
import 'package:my_social_app/views/story/pages/display_story_user_views_page/widgets/story_user_view_item.dart';

class StoryUserViewItems extends StatelessWidget {
  final Iterable<StoryUserViewState> storyUserViews;
  const StoryUserViewItems({
    super.key,
    required this.storyUserViews
  });

  @override
  Widget build(BuildContext context) {
    return AppColumn(
      children: storyUserViews.map((e) => StoryUserViewItem(storyUserViewState: e))
    );
  }
}