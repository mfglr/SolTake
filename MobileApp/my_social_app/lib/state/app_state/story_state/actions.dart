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
class DeleteStoryAction extends StoryAction{
  final int storyId;
  const DeleteStoryAction({required this.storyId});
}
@immutable
class DeleteStorySuccessAction extends StoryAction{
  final int storyId;
  const DeleteStorySuccessAction({required this.storyId});
}

@immutable
class NextStoryUserViewsAction extends StoryAction{
  final int storyId;
  const NextStoryUserViewsAction({required this.storyId});  
}
@immutable
class NextStoryUserViewsSuccessAction extends StoryAction{
  final int storyId;
  final Iterable<StoryUserViewState> storyUserViews;

  const NextStoryUserViewsSuccessAction({required this.storyId, required this.storyUserViews});
}
@immutable
class NextStoryUserViewsFailedAction extends StoryAction{
  final int storyId;
  const NextStoryUserViewsFailedAction({required this.storyId});
}

@immutable
class FirstStoryUserViewsAction extends StoryAction{
  final int storyId;
  const FirstStoryUserViewsAction({required this.storyId});
}
@immutable
class FirstStoryUserViewsSuccessAction extends StoryAction{
  final int storyId;
  final Iterable<StoryUserViewState> storyUserViews;
  const FirstStoryUserViewsSuccessAction({required this.storyId, required this.storyUserViews});
}
@immutable
class FirstStoryUserViewsFailedAction extends StoryAction{
  final int storyId;
  const FirstStoryUserViewsFailedAction({required this.storyId});
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
