import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/services/comment_service.dart';
import 'package:my_social_app/services/solution_service.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/image_status.dart';
import 'package:my_social_app/state/app_state/question_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_status.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/user_image_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/user_image_entity_state/user_image_state.dart';
import 'package:redux/redux.dart';

void loadSolutionMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is LoadSolutionAction){
    if(store.state.solutionEntityState.entities[action.solutionId] == null){
      SolutionService()
        .getSolutionById(action.solutionId)
        .then((solution){
          store.dispatch(AddSolutionAction(solution: solution.toSolutionState()));
          store.dispatch(AddUserImageAction(image: UserImageState.init(solution.appUserId)));
        });
    }
  }
  next(action);
}
void loadSolutionImageMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is LoadSolutionImageAction){
    final image = store.state.solutionEntityState.entities[action.solutionId]!.images.elementAt(action.index);
    if(image.state == ImageStatus.notStarted){
      SolutionService()
        .getSolutionImage(action.solutionId,image.id)
        .then((image) => store.dispatch(
          LoadSolutionImageSuccessAction(solutionId: action.solutionId,index: action.index,image: image)
        ));
    }
  }
  next(action);
}

void removeSolutionMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is RemoveSolutionAction){
    final question = store.state.questionEntityState.entities[action.solution.questionId];
    SolutionService()
      .delete(action.solution.id)
      .then((_){
        if(question != null){
          store.dispatch(RemoveQuestionSolutionAction(solution: action.solution));
          if(action.solution.state == SolutionStatus.correct && question.numberOfCorrectSolutions <= 1){
            store.dispatch(MarkUserQuestionAsUnsolvedAction(userId: question.appUserId, questionId: action.solution.questionId));
          }
        }
        store.dispatch(RemoveSolutionSuccessAction(solutionId: action.solution.id));
      });
  }
  next(action);
}

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

void getNextPageSolutionCommentsIfNoPageMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetNextPageSolutionCommentsIfNoPageAction){
    final comments = store.state.solutionEntityState.entities[action.solutionId]!.comments;
    if(comments.isReadyForNextPage && !comments.hasAtLeastOnePage){
      store.dispatch(GetNextPageSolutionCommentsAction(solutionId: action.solutionId));
    }
  }
  next(action);
}
void getNextPageSolutionCommentsIfReadyMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetNextPageSolutionCommentsIfReadyAction){
    final comments = store.state.solutionEntityState.entities[action.solutionId]!.comments;
    if(comments.isReadyForNextPage){
      store.dispatch(GetNextPageSolutionCommentsAction(solutionId: action.solutionId));
    }
  }
  next(action);
}
void getNextPageSolutionCommentsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetNextPageSolutionCommentsAction){
    final pagination = store.state.solutionEntityState.entities[action.solutionId]!.comments;
    CommentService()
      .getBySolutionId(action.solutionId,pagination.next)
      .then((comments){
        store.dispatch(AddCommentsAction(comments: comments.map((e) => e.toCommentState())));
        store.dispatch(AddUserImagesAction(images: comments.map((e) => UserImageState.init(commentsPerPage))));
        store.dispatch(AddNextPageSolutionCommentsAction(solutionId: action.solutionId,commentsIds: comments.map((e) => e.id)));
      });
  }
  next(action);
}

void markSolutionAsCorrectMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is MarkSolutionAsCorrectAction){
    final currentUserId = store.state.accountState!.id;
    SolutionService()
      .markAsCorrect(action.solutionId)
      .then((_){
        store.dispatch(MarkSolutionAsCorrectSuccessAction(solutionId: action.solutionId));
        store.dispatch(MarkQuestionSolutionAsCorrectAction(questionId: action.questionId, solutionId: action.solutionId));
        store.dispatch(MarkUserQuestionAsSolvedAction(userId: currentUserId, questionId: action.questionId));
      });
  }
  next(action);
}
void markSolutionAsIncorrectMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is MarkSolutionAsIncorrectAction){
    SolutionService()
      .markAsIncorrect(action.solutionId)
      .then((_){
        store.dispatch(MarkSolutionAsIncorrectSuccessAction(solutionId: action.solutionId));
        store.dispatch(MarkQuestionSolutionAsIncorrectAction(questionId: action.questionId, solutionId: action.solutionId));
      });
  }
  next(action);
}