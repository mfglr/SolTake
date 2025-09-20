import 'package:my_social_app/state/story_state/actions.dart';
import 'package:my_social_app/state/story_state/story_state.dart';
import 'package:my_social_app/custom_packages/entity_state/entity_collection/entity_state.dart';
import 'package:redux/redux.dart';

EntityState<int,StoryState> createStorySuccessReducer(EntityState<int,StoryState> prev, CreateStorySuccessAction action)
  => prev.appendMany(action.stories);
EntityState<int,StoryState> getVieweableStoriesSuccessReducer(EntityState<int,StoryState> prev, GetStoriesSuccessAction action)
  => prev.appendMany(action.stories);
EntityState<int,StoryState> viewStoryReducer(EntityState<int,StoryState> prev,ViewStorySuccessAction action)
  => prev.updateOne(prev.getValue(action.storyId)!.view(action.storyUserView));
EntityState<int,StoryState> deleteStorySuccessAction(EntityState<int,StoryState> prev,DeleteStorySuccessAction action)
  => prev.removeOne(action.storyId);

EntityState<int,StoryState> nextStoryUserViewsReducer(EntityState<int,StoryState> prev, NextStoryUserViewsAction action)
  => prev.updateOne(prev.getValue(action.storyId)!.startLoadingNext());
EntityState<int,StoryState> nextStoryUserViewsSuccessReducer(EntityState<int,StoryState> prev, NextStoryUserViewsSuccessAction action)
  => prev.updateOne(prev.getValue(action.storyId)!.addNextPageViews(action.storyUserViews));
EntityState<int,StoryState> nextStoryUserViewsFailedReducer(EntityState<int,StoryState> prev, NextStoryUserViewsFailedAction action)
  => prev.updateOne(prev.getValue(action.storyId)!.stopLoadingNext());

EntityState<int,StoryState> firstStoryUserViewsReducer(EntityState<int,StoryState> prev, FirstStoryUserViewsAction action)
  => prev.updateOne(prev.getValue(action.storyId)!.startLoadingNext());
EntityState<int,StoryState> firstStoryUserViewsSuccessReducer(EntityState<int,StoryState> prev, FirstStoryUserViewsSuccessAction action)
  => prev.updateOne(prev.getValue(action.storyId)!.refreshPageViews(action.storyUserViews));
EntityState<int,StoryState> firstStoryUserViewsFailedReducer(EntityState<int,StoryState> prev, FirstStoryUserViewsFailedAction action)
  => prev.updateOne(prev.getValue(action.storyId)!.stopLoadingNext());

Reducer<EntityState<int,StoryState>> storyReducers = combineReducers<EntityState<int,StoryState>>([
  TypedReducer<EntityState<int,StoryState>,CreateStorySuccessAction>(createStorySuccessReducer).call,
  TypedReducer<EntityState<int,StoryState>,GetStoriesSuccessAction>(getVieweableStoriesSuccessReducer).call,
  TypedReducer<EntityState<int,StoryState>,ViewStorySuccessAction>(viewStoryReducer).call,
  TypedReducer<EntityState<int,StoryState>,DeleteStorySuccessAction>(deleteStorySuccessAction).call,

  TypedReducer<EntityState<int,StoryState>,NextStoryUserViewsAction>(nextStoryUserViewsReducer).call,
  TypedReducer<EntityState<int,StoryState>,NextStoryUserViewsSuccessAction>(nextStoryUserViewsSuccessReducer).call,
  TypedReducer<EntityState<int,StoryState>,NextStoryUserViewsFailedAction>(nextStoryUserViewsFailedReducer).call,

  TypedReducer<EntityState<int,StoryState>,FirstStoryUserViewsAction>(firstStoryUserViewsReducer).call,
  TypedReducer<EntityState<int,StoryState>,FirstStoryUserViewsSuccessAction>(firstStoryUserViewsSuccessReducer).call,
  TypedReducer<EntityState<int,StoryState>,FirstStoryUserViewsFailedAction>(firstStoryUserViewsFailedReducer).call,
]);