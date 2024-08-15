import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/services/comment_service.dart';
import 'package:my_social_app/services/solution_service.dart';
import 'package:my_social_app/state/comment_entity_state/actions.dart';
import 'package:my_social_app/state/solution_entity_state/actions.dart';
import 'package:my_social_app/state/solution_image_entity_state/actions.dart';
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

void loadSolutionMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is LoadSolutionAction){
    if(store.state.solutionEntityState.entities[action.solutionId] == null){
      SolutionService()
        .getSolutionById(action.solutionId)
        .then((solution){
          store.dispatch(AddSolutionAction(solution: solution.toSolutionState()));
          store.dispatch(AddSolutionImagesAction(images: solution.images.map((e) => e.toSolutionImageState())));
          store.dispatch(AddUserImageAction(image: UserImageState.init(solution.appUserId)));
        });
    }
  }
  next(action);
}

void getNextPageSolutionCommentsIfNoPageMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetNextPageSolutionCommentsIfNoPageAction){
    final comments = store.state.solutionEntityState.entities[action.solutionId]!.comments;
    if(comments.isReadyForNextPage && !comments.hasAtLeastOnePage){
      store.dispatch(GetNextPageSolutionCommentsAction(solutionId: action.solutionId));
    }
  }
  next(action);
}
void getNextPageSolutionCommentsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetNextPageSolutionCommentsAction){
    final comments = store.state.solutionEntityState.entities[action.solutionId]!.comments;
    if(!comments.isLast){
      CommentService()
        .getBySolutionId(action.solutionId,comments.lastValue,commentsPerPage,true)
        .then((comments){
          store.dispatch(AddCommentsAction(comments: comments.map((e) => e.toCommentState())));
          store.dispatch(AddUserImagesAction(images: comments.map((e) => UserImageState.init(commentsPerPage))));
          store.dispatch(AddNextPageSolutionCommentsAction(solutionId: action.solutionId,commentsIds: comments.map((e) => e.id)));
        });
    }
  }
  next(action);
}
