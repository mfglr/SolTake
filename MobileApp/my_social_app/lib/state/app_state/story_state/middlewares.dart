import 'package:my_social_app/services/story_service.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/story_state/actions.dart';
import 'package:redux/redux.dart';

void createStoryMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is CreateStoryAction){
    StoryService()
      .create(action.appFiles)
      .then((stories) => store.dispatch(CreateStorySuccessAction(stories: stories.map((e) => e.toStoryState()))));
  }
  next(action);
}

void getStoriesMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetStoriesAction){
    StoryService()
      .getStories()
      .then((stories) => store.dispatch(GetStoriesSuccessAction(stories: stories.map((e) => e.toStoryState()))));
  }
  next(action);
}
