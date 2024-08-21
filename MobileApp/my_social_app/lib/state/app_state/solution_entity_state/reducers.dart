import 'package:my_social_app/state/app_state/solution_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_entity_state.dart';
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


SolutionEntityState getNextPageCommentsReducer(SolutionEntityState prev,GetNextPageSolutionCommentsAction action)
  => prev.getNextPageComments(action.solutionId);
SolutionEntityState addNextPageCommentsReducer(SolutionEntityState prev,AddNextPageSolutionCommentsAction action)
  => prev.addNextPageComments(action.solutionId,action.commentsIds);
SolutionEntityState addCommentReducer(SolutionEntityState prev,AddSolutionCommentAction action)
  => prev.addComment(action.solutionId,action.commentId);
SolutionEntityState removeCommentReducer(SolutionEntityState prev,RemoveSolutionCommentAction action)
  => prev.removeComment(action.solutionId,action.commentId);

SolutionEntityState startLoadingImageReducer(SolutionEntityState prev,LoadSolutionImageAction action)
  => prev.startLoadingImage(action.solutionId, action.index);
SolutionEntityState loadImageReducer(SolutionEntityState prev,LoadSolutionImageSuccessAction action)
  => prev.loadImage(action.solutionId, action.index, action.image);

SolutionEntityState markAsCorrectReducer(SolutionEntityState prev, MarkSolutionAsCorrectSuccessAction action)
  => prev.markAsCorrect(action.solutionId);
SolutionEntityState markAsIncorrectReducer(SolutionEntityState prev, MarkSolutionAsIncorrectSuccessAction action)
  => prev.markAsIncorrect(action.solutionId);

Reducer<SolutionEntityState> solutionEntityStateReducers = combineReducers<SolutionEntityState>([
  TypedReducer<SolutionEntityState,AddSolutionAction>(addSolutionReducer).call,
  TypedReducer<SolutionEntityState,AddSolutionsAction>(addSolutionsReducer).call,
  TypedReducer<SolutionEntityState,MakeUpvoteSuccessAction>(makeUpvoteReducer).call,
  TypedReducer<SolutionEntityState,MakeDownvoteSuccessAction>(makeDownvoteReducer).call,
  TypedReducer<SolutionEntityState,RemoveUpvoteSuccessAction>(removeUpvoteReducer).call,
  TypedReducer<SolutionEntityState,RemoveDownvoteSuccessAction>(removeDownVoteAction).call,

  TypedReducer<SolutionEntityState,GetNextPageSolutionCommentsAction>(getNextPageCommentsReducer).call,
  TypedReducer<SolutionEntityState,AddNextPageSolutionCommentsAction>(addNextPageCommentsReducer).call,
  TypedReducer<SolutionEntityState,AddSolutionCommentAction>(addCommentReducer).call,
  TypedReducer<SolutionEntityState,RemoveSolutionCommentAction>(removeCommentReducer).call,

  TypedReducer<SolutionEntityState,LoadSolutionImageAction>(startLoadingImageReducer).call,
  TypedReducer<SolutionEntityState,LoadSolutionImageSuccessAction>(loadImageReducer).call,

  TypedReducer<SolutionEntityState,MarkSolutionAsCorrectSuccessAction>(markAsCorrectReducer).call,
  TypedReducer<SolutionEntityState,MarkSolutionAsIncorrectSuccessAction>(markAsIncorrectReducer).call,

]);