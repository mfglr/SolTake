import 'package:app_file/app_file.dart';
import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/story_state/story_state.dart';
import 'package:my_social_app/state/app_state/story_state/story_user_view_state.dart';

@immutable
class StoryAction extends AppAction{
  const StoryAction();
}

@immutable
class GetStoriesAction extends StoryAction{
  const GetStoriesAction();
}
@immutable
class GetStoriesSuccessAction extends StoryAction{
  final Iterable<StoryState> stories;
  const GetStoriesSuccessAction({required this.stories});
}

@immutable
class CreateStoryAction extends StoryAction{
  final Iterable<AppFile> appFiles;
  const CreateStoryAction({required this.appFiles});
}
@immutable
class CreateStorySuccessAction extends StoryAction{
  final Iterable<StoryState> stories;
  const CreateStorySuccessAction({required this.stories});
}

@immutable
class ViewStoryAction extends StoryAction{
  final int storyId;
  const ViewStoryAction({required this.storyId});
}
@immutable
class ViewStorySuccessAction extends StoryAction{
  final int storyId;
  final StoryUserViewState storyUserView;
  const ViewStorySuccessAction({
    required this.storyId,
    required this.storyUserView
  });
}
