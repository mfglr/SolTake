import 'package:my_social_app/state/solution_entity_state/actions.dart';
import 'package:my_social_app/state/solution_entity_state/solution_entity_state.dart';
import 'package:redux/redux.dart';

SolutionEntityState addSolutionReducer(SolutionEntityState prev, AddSolutionAction action)
  => SolutionEntityState(entities: prev.appendOne(action.solution));
SolutionEntityState addSolutionsReducer(SolutionEntityState prev, AddSolutionsAction action)
  => SolutionEntityState(entities: prev.appendMany(action.solutions));

SolutionEntityState makeUpvoteReducer(SolutionEntityState prev,MakeUpvoteSuccessAction action)
  => prev.makeUpvote(action.solutionId);
SolutionEntityState makeDownvoteReducer(SolutionEntityState prev,MakeDownvoteSuccessAction action)
  => prev.makeDownvote(action.solutionId);
SolutionEntityState removeUpvoteReducer(SolutionEntityState prev,RemoveUpvoteSuccessAction action)
  => prev.removeUpvote(action.solutionId);
SolutionEntityState removeDownVoteAction(SolutionEntityState prev,RemoveDownvoteSuccessAction action)
  => prev.removeDownvote(action.solutionId);

SolutionEntityState addSolutionCommentReducer(SolutionEntityState prev,AddSolutionCommentAction action)
  => prev.addSolutionComment(action.solutionId,action.commentId);
SolutionEntityState nextPageSolutionCommentsSuccessReducer(SolutionEntityState prev,NextPageSolutionCommentsSuccessAction action)
  => prev.addSolutionComments(action.solutionId,action.commentsIds);

Reducer<SolutionEntityState> solutionEntityStateReducers = combineReducers<SolutionEntityState>([
  TypedReducer<SolutionEntityState,AddSolutionAction>(addSolutionReducer).call,
  TypedReducer<SolutionEntityState,AddSolutionsAction>(addSolutionsReducer).call,
  TypedReducer<SolutionEntityState,MakeUpvoteSuccessAction>(makeUpvoteReducer).call,
  TypedReducer<SolutionEntityState,MakeDownvoteSuccessAction>(makeDownvoteReducer).call,
  TypedReducer<SolutionEntityState,RemoveUpvoteSuccessAction>(removeUpvoteReducer).call,
  TypedReducer<SolutionEntityState,RemoveDownvoteSuccessAction>(removeDownVoteAction).call,
  TypedReducer<SolutionEntityState,AddSolutionCommentAction>(addSolutionCommentReducer).call,
  TypedReducer<SolutionEntityState,NextPageSolutionCommentsSuccessAction>(nextPageSolutionCommentsSuccessReducer).call,
]);