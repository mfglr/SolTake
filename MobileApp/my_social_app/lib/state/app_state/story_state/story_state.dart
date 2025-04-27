import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:multimedia/models/multimedia.dart';
import 'package:my_social_app/state/app_state/story_state/story_circle_state.dart';
import 'package:my_social_app/state/app_state/story_state/story_user_view_state.dart';
import 'package:my_social_app/state/entity_state/base_entity.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';

@immutable
class StoryState extends BaseEntity<int>{
  final int userId;
  final DateTime createdAt;
  final bool isViewed;
  final String userName;
  final Multimedia? image;
  final Multimedia media;
  final Pagination<int,StoryUserViewState> viewers;
  final int numberOfViewers;

  StoryState({
    required super.id,
    required this.createdAt,
    required this.isViewed,
    required this.userId,
    required this.userName,
    required this.image,
    required this.media,
    required this.viewers,
    required this.numberOfViewers
  });
  
  static int _compareTo(StoryState x, StoryState y){
    if (!x.isViewed && y.isViewed) return 1;
    if (x.isViewed && !y.isViewed) return -1;
    return x.id > y.id ? 1 : -1;
  }
  static int compareToList(Iterable<StoryState> x, Iterable<StoryState> y)
    => _compareTo(x.sorted((a,b) => _compareTo(a, b)).last, y.sorted((a,b) => _compareTo(a, b)).last);

  static bool _isAllViewed(Iterable<StoryState> stories) => !stories.any((story) => !story.isViewed);
  static StoryCircleState toStoryCircleState(Iterable<StoryState> stories) =>
    StoryCircleState(
      userId: stories.first.userId,
      image: stories.first.image,
      isViewed: _isAllViewed(stories),
      userName: stories.first.userName
    );

  StoryState view(StoryUserViewState storyUserView) =>
    StoryState(
      id: id,
      createdAt: createdAt,
      isViewed: true,
      userId: userId,
      userName: userName,
      image: image,
      media: media,
      viewers: viewers.prependOne(storyUserView),
      numberOfViewers: numberOfViewers + 1
    );
  
  StoryState startLoadingNext() =>
    StoryState(
      id: id,
      createdAt: createdAt,
      isViewed: isViewed,
      userId: userId,
      userName: userName,
      image: image,
      media: media,
      viewers: viewers.startLoadingNext(),
      numberOfViewers: numberOfViewers
    );
  StoryState stopLoadingNext() =>
    StoryState(
      id: id,
      createdAt: createdAt,
      isViewed: isViewed,
      userId: userId,
      userName: userName,
      image: image,
      media: media,
      viewers: viewers.stopLoadingNext(),
      numberOfViewers: numberOfViewers
    );
  StoryState addFirstPageViews(Iterable<StoryUserViewState> storyUserViews) =>
    StoryState(
      id: id,
      createdAt: createdAt,
      isViewed: isViewed,
      userId: userId,
      userName: userName,
      image: image,
      media: media,
      viewers: viewers.addfirstPage(storyUserViews),
      numberOfViewers: numberOfViewers
    );
  StoryState addNextPageViews(Iterable<StoryUserViewState> storyUserView) =>
    StoryState(
      id: id,
      createdAt: createdAt,
      isViewed: isViewed,
      userId: userId,
      userName: userName,
      image: image,
      media: media,
      viewers: viewers.addNextPage(storyUserView),
      numberOfViewers: numberOfViewers
    );
}