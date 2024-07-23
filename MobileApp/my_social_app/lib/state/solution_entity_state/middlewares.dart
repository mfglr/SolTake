import 'package:my_social_app/services/solution_service.dart';
import 'package:my_social_app/state/solution_entity_state/actions.dart';
import 'package:my_social_app/state/state.dart';
import 'package:redux/redux.dart';

void markSolutionAsApprovedMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is MarkSolutionAsApprovedAction){
    SolutionService()
      .markAsApproved(action.solutionId)
      .then((_) => store.dispatch(MarkSolutionAsApprovedSuccessAction(solutionId: action.solutionId)));
  }
  next(action);
}

void markSolutionAsPendingMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is MarkSolutionAsPendingAction){
    SolutionService()
      .markAsPending(action.solutionId)
      .then((_) => store.dispatch(MarkSolutionAsPendingSuccessAction(solutionId: action.solutionId)));
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