import 'package:my_social_app/state/app_state/story_state/actions.dart';
import 'package:my_social_app/state/app_state/story_state/story_state.dart';
import 'package:my_social_app/state/entity_state/entity_state.dart';
import 'package:redux/redux.dart';

EntityState<int,StoryState> createStorySuccessReducer(EntityState<int,StoryState> prev, CreateStorySuccessAction action)
  => prev.appendMany(action.stories);
EntityState<int,StoryState> getVieweableStoriesSuccessReducer(EntityState<int,StoryState> prev, GetStoriesSuccessAction action)
  => prev.appendMany(action.stories);
EntityState<int,StoryState> viewStoryReducer(EntityState<int,StoryState> prev,ViewStorySuccessAction action)
  => prev.updateOne(prev.getValue(action.storyId)!.view(action.storyUserView));
EntityState<int,StoryState> deleteStorySuccessAction(EntityState<int,StoryState> prev,DeleteStorySuccessAction action)
  => prev.removeOne(action.storyId);

Reducer<EntityState<int,StoryState>> storyReducers = combineReducers<EntityState<int,StoryState>>([
  TypedReducer<EntityState<int,StoryState>,CreateStorySuccessAction>(createStorySuccessReducer).call,
  TypedReducer<EntityState<int,StoryState>,GetStoriesSuccessAction>(getVieweableStoriesSuccessReducer).call,
  TypedReducer<EntityState<int,StoryState>,ViewStorySuccessAction>(viewStoryReducer).call,
  TypedReducer<EntityState<int,StoryState>,DeleteStorySuccessAction>(deleteStorySuccessAction).call,
]);