import 'package:collection/collection.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/story_state/story_circle_state.dart';
import 'package:my_social_app/state/app_state/story_state/story_state.dart';
import 'package:my_social_app/state/entity_state/page.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';
import 'package:redux/redux.dart';

int _selectCurrentUserId(Store<AppState> store) => store.state.loginState!.id;

StoryState selectStory(Store<AppState> store, int storyId) => store.state.stories.getValue(storyId)!;

Iterable<StoryState> selectCurrentUserStories(Store<AppState> store) =>
  store.state.stories.values
    .where((story) => story.userId == _selectCurrentUserId(store))
    .sorted((x,y) => y.id.compareTo(x.id));

Iterable<Iterable<StoryState>> _selectOtherUserStories(Store<AppState> store) =>
  groupBy(
    store.state.stories.values
    .where((story) => story.userId != _selectCurrentUserId(store))
    .sorted((x,y) => y.id.compareTo(x.id)),
    (s) => s.userId
  )
  .values;

bool isViewed(Store<AppState> store, int id) => store.state.stories.getValue(id)?.isViewed ?? true;

Iterable<StoryCircleState> selectHomePageStories(Store<AppState> store) =>
  _selectOtherUserStories(store)
  .sorted((x,y) => StoryState.compareToList(x, y))
  .reversed
  .map((stories) => StoryState.toStoryCircleState(stories));

Iterable<Iterable<StoryState>> selectAllStories(Store<AppState> store){
  final currentUserStories = selectCurrentUserStories(store);
  final otherUserStories =
    _selectOtherUserStories(store)
    .sorted((x,y) => StoryState.compareToList(x, y))
    .reversed;

  if(currentUserStories.isNotEmpty) return [ currentUserStories, ...otherUserStories];
  return otherUserStories;
}

Pagination selectStoryUserViewPagination(Store<AppState> store,int storyId) => 
  selectStory(store, storyId).viewers;
Page selectStoryUserViewNextPage(Store<AppState> store, int storyId) =>
  store.state.stories.getValue(storyId)!.viewers.next;

  