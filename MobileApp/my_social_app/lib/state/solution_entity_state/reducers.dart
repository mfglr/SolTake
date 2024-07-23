import 'package:my_social_app/state/solution_entity_state/actions.dart';
import 'package:my_social_app/state/solution_entity_state/solution_entity_state.dart';
import 'package:redux/redux.dart';

SolutionEntityState addSolutionReducer(SolutionEntityState prev, AddSolutionAction action)
  => SolutionEntityState(entities: prev.appendOne(action.solution));
SolutionEntityState addSolutionsReducer(SolutionEntityState prev, AddSolutionsAction action)
  => SolutionEntityState(entities: prev.appendMany(action.solutions));

SolutionEntityState markSolutionAsApprovedSuccessReducer(SolutionEntityState prev,MarkSolutionAsApprovedSuccessAction action)
  => prev.markAsApproved(action.solutionId);
SolutionEntityState markSolutionAsPendingSuccessReducer(SolutionEntityState prev,MarkSolutionAsPendingSuccessAction action)
  => prev.markAsPending(action.solutionId);

SolutionEntityState makeUpvoteReducer(SolutionEntityState prev,MakeUpvoteSuccessAction action)
  => prev.makeUpvote(action.solutionId);
SolutionEntityState makeDownvoteReducer(SolutionEntityState prev,MakeDownvoteSuccessAction action)
  => prev.makeDownvote(action.solutionId);
SolutionEntityState removeUpvoteReducer(SolutionEntityState prev,RemoveUpvoteSuccessAction action)
  => prev.removeUpvote(action.solutionId);
SolutionEntityState removeDownVoteAction(SolutionEntityState prev,RemoveDownvoteSuccessAction action)
  => prev.removeDownvote(action.solutionId);

Reducer<SolutionEntityState> solutionEntityStateReducers = combineReducers<SolutionEntityState>([
  TypedReducer<SolutionEntityState,AddSolutionAction>(addSolutionReducer).call,
  TypedReducer<SolutionEntityState,AddSolutionsAction>(addSolutionsReducer).call,
  
  TypedReducer<SolutionEntityState,MarkSolutionAsApprovedSuccessAction>(markSolutionAsApprovedSuccessReducer).call,
  TypedReducer<SolutionEntityState,MarkSolutionAsPendingSuccessAction>(markSolutionAsPendingSuccessReducer).call,

  TypedReducer<SolutionEntityState,MakeUpvoteSuccessAction>(makeUpvoteReducer).call,
  TypedReducer<SolutionEntityState,MakeDownvoteSuccessAction>(makeDownvoteReducer).call,
  TypedReducer<SolutionEntityState,RemoveUpvoteSuccessAction>(removeUpvoteReducer).call,
  TypedReducer<SolutionEntityState,RemoveDownvoteSuccessAction>(removeDownVoteAction).call,
]);