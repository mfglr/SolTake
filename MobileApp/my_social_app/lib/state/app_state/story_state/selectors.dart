import 'package:collection/collection.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/story_state/story_state.dart';
import 'package:redux/redux.dart';

int _selectCurrentUserId(Store<AppState> store) => store.state.loginState!.id;

StoryState _selectCurrentUserFirstStory(Store<AppState> store) =>
  store.state.stories.firstWhere((story) => story.userId == _selectCurrentUserId(store));

Iterable<StoryState> selectHomePageStories(Store<AppState> store) =>
  [
    _selectCurrentUserFirstStory(store),
    ...groupBy(
      store.state.stories.where((story) => story.userId != _selectCurrentUserId(store)),
      (story) => story.userId
    )
    .values
    .map((list) => list.sorted((x,y) => x.id.compareTo(y.id)).last)
  ];

Iterable<StoryState> _selectCurrentUserStories(Store<AppState> store) =>
  store.state.stories.where((story) => story.userId == _selectCurrentUserId(store));

Iterable<Iterable<StoryState>> selectAllStories(Store<AppState> store) =>
  [
    _selectCurrentUserStories(store),
    ...groupBy(
      store.state.stories.where((story) => story.userId != _selectCurrentUserId(store)),
      (story) => story.userId
    )
    .values
  ];
  