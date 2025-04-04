import 'package:app_file/app_file.dart';
import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/story_state/story_state.dart';

@immutable
class StoryAction extends AppAction{
  const StoryAction();
}

@immutable
class LoadStoriesAction extends StoryAction{
  const LoadStoriesAction();
}

@immutable
class LoadStoriesSuccessAction extends StoryAction{
  final Iterable<StoryState> stories;
  const LoadStoriesSuccessAction({required this.stories});
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