import 'package:my_social_app/state/app_state/story_state/actions.dart';
import 'package:my_social_app/state/app_state/story_state/story_state.dart';

Iterable<StoryState> createStorySuccessReducer(Iterable<StoryState> prev, CreateStorySuccessAction action)
  => [...action.stories, ...prev];

Iterable<StoryState> loadStoriesSuccessReducer(Iterable<StoryState> prev, LoadStoriesSuccessAction action)
  => [...action.stories, ...prev];
