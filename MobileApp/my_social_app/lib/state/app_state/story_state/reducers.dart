import 'package:my_social_app/state/app_state/story_state/actions.dart';
import 'package:my_social_app/state/app_state/story_state/story_state.dart';
import 'package:redux/redux.dart';

Iterable<StoryState> createStorySuccessReducer(Iterable<StoryState> prev, CreateStorySuccessAction action)
  => [...action.stories, ...prev];

Iterable<StoryState> getVieweableStoriesSuccessReducer(Iterable<StoryState> prev, GetStoriesSuccessAction action)
  => [...action.stories, ...prev];

Reducer<Iterable<StoryState>> storyReducers = combineReducers<Iterable<StoryState>>([
  TypedReducer<Iterable<StoryState>,CreateStorySuccessAction>(createStorySuccessReducer).call,
  TypedReducer<Iterable<StoryState>,GetStoriesSuccessAction>(getVieweableStoriesSuccessReducer).call,
]);