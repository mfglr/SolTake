import 'package:flutter/cupertino.dart';
import 'package:my_social_app/state/follows_state/follow_state.dart';
import 'package:my_social_app/state/follows_state/selectors.dart';
import 'package:my_social_app/state/users_state/user_state.dart';
import 'package:my_social_app/packages/entity_state/map_extentions.dart';
import 'package:my_social_app/packages/entity_state/pagination.dart';

@immutable
class FollowsState {
  final Map<int, Pagination<int, FollowState>> followers;
  final Map<int, Pagination<int, FollowState>> followeds;

  const FollowsState({
    required this.followers,
    required this.followeds
  });

  FollowsState follow(UserState follower, UserState followed, int followId) =>
    FollowsState(
      followers:
        followers
          .setOne(followed.id, followers[followed.id]?.addOne(follower.toFollower(followId))),
      followeds:
        followeds
          .setOne(follower.id, followeds[follower.id]?.addOne(followed.toFollowed(followId))),
    );
  FollowsState unfollow(UserState follower, UserState followed) =>
    FollowsState(
      followers:
        followers
          .setOne(followed.id, followers[followed.id]?.where((e) => e.userId != follower.id)),
      followeds:
        followeds
          .setOne(follower.id, followeds[follower.id]?.where((e) => e.userId != followed.id)),
    );
  
  FollowsState startLoadingNextFollowers(int userId) =>
    FollowsState(
      followers: followers.setOne(userId, selectFollowersFromState(this,userId).startLoadingNext()),
      followeds: followeds
    );
  FollowsState addNextFollowers(int userId, Iterable<FollowState> follows) =>
    FollowsState(
      followers: followers.setOne(userId, selectFollowersFromState(this,userId).addNextPage(follows)),
      followeds: followeds
    );
  FollowsState refreshFollowers(int userId, Iterable<FollowState> follows) =>
    FollowsState(
      followers: followers.setOne(userId, selectFollowersFromState(this,userId).refreshPage(follows)),
      followeds: followeds
    );
  FollowsState stopLoadingNextFollowers(int userId) =>
    FollowsState(
      followers: followers.setOne(userId, selectFollowersFromState(this,userId).stopLoadingNext()),
      followeds: followeds
    );

  FollowsState startLoadingNextFolloweds(int userId) =>
    FollowsState(
      followers: followers,
      followeds: followeds.setOne(userId, selectFollowedsFromState(this,userId).startLoadingNext())
    );
  FollowsState addNextFolloweds(int userId, Iterable<FollowState> follows) =>
    FollowsState(
      followers: followers,
      followeds: followeds.setOne(userId, selectFollowedsFromState(this,userId).addNextPage(follows))
    );
  FollowsState refreshFolloweds(int userId, Iterable<FollowState> follows) =>
    FollowsState(
      followers: followers,
      followeds: followeds.setOne(userId, selectFollowedsFromState(this,userId).refreshPage(follows))
    );
  FollowsState stopLoadingNextFolloweds(int userId) =>
    FollowsState(
      followers: followers,
      followeds: followeds.setOne(userId, selectFollowedsFromState(this,userId).stopLoadingNext())
    );
}