import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/story_state/story_state.dart';
import 'package:redux/redux.dart';

Iterable<StoryState> selectStories(Store<AppState> store) => store.state.stories;