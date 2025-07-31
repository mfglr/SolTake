import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/story_state/story_user_view_state.dart';
import 'package:my_social_app/views/shared/app_date_widget.dart';
import 'package:my_social_app/views/shared/user_item/user_item_widget.dart';
import 'package:my_social_app/views/user/pages/user_page/pages/user_page/user_page.dart';

class StoryUserViewItem extends StatelessWidget {
  final StoryUserViewState storyUserViewState;
  const StoryUserViewItem({
    super.key,
    required this.storyUserViewState
  });

  @override
  Widget build(BuildContext context) {
    return UserItemWidget(
      userItem: storyUserViewState,
      rightWidget: AppDateWidget(dateTime: storyUserViewState.createdAt),
      onPressed: () =>
        Navigator
          .of(context)
          .push(MaterialPageRoute(builder: (context) => UserPage(userId: storyUserViewState.userId,))),
    );
  }
}