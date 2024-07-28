import 'package:my_social_app/services/comment_service.dart';
import 'package:my_social_app/services/solution_service.dart';
import 'package:my_social_app/state/comment_entity_state/actions.dart';
import 'package:my_social_app/state/image_state.dart';
import 'package:my_social_app/state/solution_entity_state/actions.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/user_image_entity_state/actions.dart';
import 'package:my_social_app/state/user_image_entity_state/user_image_state.dart';
import 'package:redux/redux.dart';

void makeUpvoteMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is MakeUpvoteAction){
    SolutionService()
      .makeUpvote(action.solutionId)
      .then((_) => store.dispatch(MakeUpvoteSuccessAction(solutionId: action.solutionId)));
  }
  next(action);
}

void makeDownvoteMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is MakeDownvoteAction){
    SolutionService()
      .makeDownvote(action.solutionId)
      .then((_) => store.dispatch(MakeDownvoteSuccessAction(solutionId: action.solutionId)));
  }
  next(action);
}

void removeUpvoteMiddleware(Store<AppState> store,action, NextDispatcher next){
  if(action is RemoveUpvoteAction){
    SolutionService()
      .removeUpvote(action.solutionId)
      .then((_) => store.dispatch(RemoveUpvoteSuccessAction(solutionId: action.solutionId)));
  }
  next(action);
}

void removeDownvoteMiddleware(Store<AppState> store,action, NextDispatcher next){
  if(action is RemoveDownvoteAction){
    SolutionService()
      .removeDownvote(action.solutionId)
      .then((_) => store.dispatch(RemoveDownvoteSuccessAction(solutionId: action.solutionId)));
  }
  next(action);
}

void nextPageSolutionCommentsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextPageSolutionCommentsAction){
    final comments = store.state.solutionEntityState.entities[action.solutionId]!.comments;
    if(!comments.isLast){
      CommentService()
        .getBySolutionId(action.solutionId,comments.lastId)
        .then((comments){
          store.dispatch(
            AddCommentsAction(
              comments: comments.map((e) => e.toCommentState())
            )
          );
          store.dispatch(
            NextPageSolutionCommentsSuccessAction(
              solutionId: action.solutionId,
              commentsIds: comments.map((e) => e.id) 
            )
          );
          store.dispatch(
            AddUserImagesAction(
              images: comments.map((e) => UserImageState(id: e.appUserId, image: null, state: ImageState.notStarted))
            )
          );
        });
    }
  }
  next(action);
}
void nextPageSolutionCommentsIfNoCommentsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextPageSolutionCommentsIfNoCommentsAction){
    final comments = store.state.solutionEntityState.entities[action.solutionId]!.comments;
    if(comments.ids.length < 20){
      store.dispatch(
        NextPageSolutionCommentsAction(
          solutionId: action.solutionId
        )
      );
    }
  }
  next(action);
}