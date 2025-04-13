import 'package:my_social_app/services/story_service.dart';
import 'package:my_social_app/services/story_user_view_service.dart';
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

void viewStoryMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is ViewStoryAction){
    StoryUserViewService()
      .create(action.storyId)
      .then((response) => store.dispatch(ViewStorySuccessAction(storyId: action.storyId, storyUserView: response.toState())));
  }
  next(action);
}


void deleteStoryMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is DeleteStoryAction){
    StoryService()
      .delete(action.storyId)
      .then((_) => store.dispatch(DeleteStorySuccessAction(storyId: action.storyId)));
  }
  next(action);
}