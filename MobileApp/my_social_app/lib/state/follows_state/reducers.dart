import 'package:my_social_app/state/follows_state/actions.dart';
import 'package:my_social_app/state/follows_state/follows_state.dart';
import 'package:redux/redux.dart';

FollowsState followSuccessReducer(FollowsState prev, FollowSuccessAction action) =>
  prev.follow(action.follower, action.followed, action.followId);
FollowsState unfollowSuccessReducer(FollowsState prev, UnfollowSuccessAction action) =>
  prev.unfollow(action.follower, action.followed);

FollowsState nextFollewersReducer(FollowsState prev, NextFollowersAction action) =>
  prev.startLoadingNextFollowers(action.userId);
FollowsState nextFollewersSuccessReducer(FollowsState prev, NextFollowersSuccessAction action) =>
  prev.addNextFollowers(action.userId,action.followers);
FollowsState nextFollewersFailedReducer(FollowsState prev, NextFollowersFailedAction action) =>
  prev.stopLoadingNextFollowers(action.userId);

FollowsState refreshFollewersReducer(FollowsState prev, RefreshFollowersAction action) =>
  prev.startLoadingNextFollowers(action.userId);
FollowsState refreshFollewersSuccessReducer(FollowsState prev, RefreshFollowersSuccessAction action) =>
  prev.refreshFollowers(action.userId,action.followers);
FollowsState refreshFollewersFailedReducer(FollowsState prev, RefreshFollowersFailedAction action) =>
  prev.stopLoadingNextFollowers(action.userId);

FollowsState nextFollewedsReducer(FollowsState prev, NextFollowedsAction action) =>
  prev.startLoadingNextFolloweds(action.userId);
FollowsState nextFollewedsSuccessReducer(FollowsState prev, NextFollowedsSuccessAction action) =>
  prev.addNextFolloweds(action.userId,action.followeds);
FollowsState nextFollewedsFailedReducer(FollowsState prev, NextFollowedsFailedAction action) =>
  prev.stopLoadingNextFolloweds(action.userId);

FollowsState refreshFollewedsReducer(FollowsState prev, RefreshFollowedsAction action) =>
  prev.startLoadingNextFolloweds(action.userId);
FollowsState refreshFollewedsSuccessReducer(FollowsState prev, RefreshFollowedsSuccessAction action) =>
  prev.refreshFollowers(action.userId,action.followeds);
FollowsState refreshFollewedsFailedReducer(FollowsState prev, RefreshFollowedsFailedAction action) =>
  prev.stopLoadingNextFolloweds(action.userId);

Reducer<FollowsState> followsReducer = combineReducers<FollowsState>([
  TypedReducer<FollowsState,FollowSuccessAction>(followSuccessReducer).call,
  TypedReducer<FollowsState,UnfollowSuccessAction>(unfollowSuccessReducer).call,
  
  TypedReducer<FollowsState,NextFollowersAction>(nextFollewersReducer).call,
  TypedReducer<FollowsState,NextFollowersSuccessAction>(nextFollewersSuccessReducer).call,
  TypedReducer<FollowsState,NextFollowersFailedAction>(nextFollewersFailedReducer).call,

  TypedReducer<FollowsState,RefreshFollowersAction>(refreshFollewersReducer).call,
  TypedReducer<FollowsState,RefreshFollowersSuccessAction>(refreshFollewersSuccessReducer).call,
  TypedReducer<FollowsState,RefreshFollowersFailedAction>(refreshFollewersFailedReducer).call,

  TypedReducer<FollowsState,NextFollowedsAction>(nextFollewedsReducer).call,
  TypedReducer<FollowsState,NextFollowedsSuccessAction>(nextFollewedsSuccessReducer).call,
  TypedReducer<FollowsState,NextFollowedsFailedAction>(nextFollewedsFailedReducer).call,

  TypedReducer<FollowsState,RefreshFollowedsAction>(refreshFollewedsReducer).call,
  TypedReducer<FollowsState,RefreshFollowedsSuccessAction>(refreshFollewedsSuccessReducer).call,
  TypedReducer<FollowsState,RefreshFollowedsFailedAction>(refreshFollewedsFailedReducer).call,
]);