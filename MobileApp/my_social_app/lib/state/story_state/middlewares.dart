import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/services/story_service.dart';
import 'package:my_social_app/services/story_user_view_service.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/story_state/actions.dart';
import 'package:my_social_app/state/story_state/selectors.dart';
import 'package:my_social_app/packages/entity_state/page.dart';
import 'package:redux/redux.dart';

void createStoryMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is CreateStoryAction){
    StoryService()
      .create(action.appFiles)
      .then((stories) => store.dispatch(CreateStorySuccessAction(stories: stories.map((e) => e.toStoryState()))));
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

void nextStoryUserViewsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is NextStoryUserViewsAction){
    StoryUserViewService()
      .getStoryUserViewsByStoryId(action.storyId, selectStoryUserViewNextPage(store,action.storyId))
      .then((response) => store.dispatch(NextStoryUserViewsSuccessAction(
        storyId: action.storyId,
        storyUserViews: response.map((e) => e.toState())
      )))
      .catchError((e) => store.dispatch(NextStoryUserViewsFailedAction(storyId: action.storyId)));
  }
  next(action);
}

void firstStoryUserViewsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is FirstStoryUserViewsAction){
    StoryUserViewService()
      .getStoryUserViewsByStoryId(action.storyId, Page.init(usersPerPage, true))
      .then((response) => store.dispatch(FirstStoryUserViewsSuccessAction(
        storyId: action.storyId,
        storyUserViews: response.map((e) => e.toState())
      )))
      .catchError((e) => store.dispatch(FirstStoryUserViewsFailedAction(storyId: action.storyId)));
  }
  next(action);
}
