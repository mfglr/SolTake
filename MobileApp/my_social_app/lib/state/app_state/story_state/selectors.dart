import 'package:collection/collection.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/story_state/story_state.dart';
import 'package:redux/redux.dart';

int _selectCurrentUserId(Store<AppState> store) => store.state.loginState!.id;

Iterable<StoryState> selectCurrentUserStories(Store<AppState> store){
  var currentUserId = _selectCurrentUserId(store);
  return store.state.stories.where((story) => story.userId == currentUserId);
}

Iterable<StoryState> selectUserStories(Store<AppState> store, int userId)
  => store.state.stories.where((story) => story.userId == userId);

Iterable<StoryState> selectHomePageStories(Store<AppState> store) =>
  groupBy(
    store.state.stories.where((story) => story.userId != _selectCurrentUserId(store)),
    (story) => story.userId
  )
  .values
  .map((list) => list.sorted((x,y) => x.id.compareTo(y.id)).last);
  