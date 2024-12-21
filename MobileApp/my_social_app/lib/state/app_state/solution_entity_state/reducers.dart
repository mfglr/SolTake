import 'package:my_social_app/state/app_state/solution_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_entity_state.dart';
import 'package:redux/redux.dart';

SolutionEntityState addSolutionReducer(SolutionEntityState prev, AddSolutionAction action)
  => SolutionEntityState(entities: prev.appendOne(action.solution));
SolutionEntityState addSolutionsReducer(SolutionEntityState prev, AddSolutionsAction action)
  => SolutionEntityState(entities: prev.appendMany(action.solutions));
SolutionEntityState removeSolutionReducer(SolutionEntityState prev,RemoveSolutionSuccessAction action)
  => SolutionEntityState(entities: prev.removeOne(action.solutionId));

SolutionEntityState nextUpvotesReducer(SolutionEntityState prev,NextSolutionUpvotesAction action)
  => prev.startLoadingNextUpvotes(action.solutionId);
SolutionEntityState nextUpvotesSuccessReducer(SolutionEntityState prev,NextSolutionUpvotesSuccessAction action)
  => prev.addNextUpvotes(action.solutionId, action.voteIds);
SolutionEntityState nextUpvotesFailedReducer(SolutionEntityState prev,NextSolutionUpvotesFailedAction action)
  => prev.stopLoadingNextUpvotes(action.solutionId);

SolutionEntityState makeUpvoteReducer(SolutionEntityState prev,MakeSolutionUpvoteSuccessAction action)
  => prev.makeUpvote(action.solutionId,action.upvoteId,action.downvoteId);
SolutionEntityState removeUpvoteReducer(SolutionEntityState prev,RemoveSolutionUpvoteSuccessAction action)
  => prev.removeUpvote(action.solutionId,action.voteId);
SolutionEntityState addNewSolutionUpvoteReducer(SolutionEntityState prev,AddNewSolutionUpvoteAction action)
  => prev.addNewUpvote(action.solutionId,action.voteId);

SolutionEntityState nextDownvotesReducer(SolutionEntityState prev,NextSolutionDownvotesAction action)
  => prev.starLoadingNextDownvotes(action.solutionId);
SolutionEntityState nextDownvotesSuccessReducer(SolutionEntityState prev,NextSolutionDownvotesSuccessAction action)
  => prev.addNextPageDownvotes(action.solutionId, action.voteIds);
SolutionEntityState nextDownvotesFailedReducer(SolutionEntityState prev,NextSolutionDownvotesFailedAction action)
  => prev.stopLoadingNextDowvotes(action.solutionId);

SolutionEntityState makeDownvoteReducer(SolutionEntityState prev,MakeSolutionDownvoteSuccessAction action)
  => prev.makeDownvote(action.solutionId,action.upvoteId,action.downvoteId);
SolutionEntityState removeDownVoteAction(SolutionEntityState prev,RemoveSolutionDownvoteSuccessAction action)
  => prev.removeDownvote(action.solutionId,action.voteId);
SolutionEntityState addNewSolutionDownvoteReducer(SolutionEntityState prev,AddNewSolutionDownvoteAction action)
  => prev.addNewDownvote(action.solutionId,action.voteId);

SolutionEntityState nextCommentsReducer(SolutionEntityState prev,NextSolutionCommentsAction action)
  => prev.startLoadingNextComments(action.solutionId);
SolutionEntityState nextCommentsSuccessReducer(SolutionEntityState prev, NextSolutionCommentsSuccessAction action)
  => prev.addNextPageComments(action.solutionId,action.commentsIds);
SolutionEntityState nextCommentsFailedReducer(SolutionEntityState prev,NextSolutionCommentsFailedAction action)
  => prev.stopLoadingNextComments(action.solutionId);

SolutionEntityState addCommentReducer(SolutionEntityState prev,AddSolutionCommentAction action)
  => prev.addComment(action.solutionId,action.commentId);
SolutionEntityState removeCommentReducer(SolutionEntityState prev,RemoveSolutionCommentAction action)
  => prev.removeComment(action.solutionId,action.commentId);
SolutionEntityState addNewCommentReducer(SolutionEntityState prev,AddNewSolutionCommentAction action)
  => prev.addNewComment(action.solutionId,action.commentId);

SolutionEntityState markAsCorrectReducer(SolutionEntityState prev, MarkSolutionAsCorrectSuccessAction action)
  => prev.markAsCorrect(action.solutionId);
SolutionEntityState markAsIncorrectReducer(SolutionEntityState prev, MarkSolutionAsIncorrectSuccessAction action)
  => prev.markAsIncorrect(action.solutionId);

SolutionEntityState saveSolutionReducer(SolutionEntityState prev, SaveSolutionSuccessAction action)
  => prev.save(action.solutionId);
SolutionEntityState unsaveSolutionReducer(SolutionEntityState prev, UnsaveSolutionSuccessAction action)
  => prev.unsave(action.solutionId);

Reducer<SolutionEntityState> solutionEntityStateReducers = combineReducers<SolutionEntityState>([
  TypedReducer<SolutionEntityState,AddSolutionAction>(addSolutionReducer).call,
  TypedReducer<SolutionEntityState,AddSolutionsAction>(addSolutionsReducer).call,
  TypedReducer<SolutionEntityState,RemoveSolutionSuccessAction>(removeSolutionReducer).call,
  TypedReducer<SolutionEntityState,MakeSolutionUpvoteSuccessAction>(makeUpvoteReducer).call,
  TypedReducer<SolutionEntityState,RemoveSolutionUpvoteSuccessAction>(removeUpvoteReducer).call,
  TypedReducer<SolutionEntityState,AddNewSolutionUpvoteAction>(addNewSolutionUpvoteReducer).call,
  TypedReducer<SolutionEntityState,MakeSolutionDownvoteSuccessAction>(makeDownvoteReducer).call,
  TypedReducer<SolutionEntityState,RemoveSolutionDownvoteSuccessAction>(removeDownVoteAction).call,
  TypedReducer<SolutionEntityState,AddNewSolutionDownvoteAction>(addNewSolutionDownvoteReducer).call,

  TypedReducer<SolutionEntityState,NextSolutionUpvotesAction>(nextUpvotesReducer).call,
  TypedReducer<SolutionEntityState,NextSolutionUpvotesSuccessAction>(nextUpvotesSuccessReducer).call,
  TypedReducer<SolutionEntityState,NextSolutionUpvotesFailedAction>(nextUpvotesFailedReducer).call,

  TypedReducer<SolutionEntityState,NextSolutionDownvotesAction>(nextDownvotesReducer).call,
  TypedReducer<SolutionEntityState,NextSolutionDownvotesSuccessAction>(nextDownvotesSuccessReducer).call,
  TypedReducer<SolutionEntityState,NextSolutionDownvotesFailedAction>(nextDownvotesFailedReducer).call,

  TypedReducer<SolutionEntityState,NextSolutionCommentsAction>(nextCommentsReducer).call,
  TypedReducer<SolutionEntityState,NextSolutionCommentsSuccessAction>(nextCommentsSuccessReducer).call,
  TypedReducer<SolutionEntityState,NextSolutionCommentsFailedAction>(nextCommentsFailedReducer).call,

  TypedReducer<SolutionEntityState,AddSolutionCommentAction>(addCommentReducer).call,
  TypedReducer<SolutionEntityState,RemoveSolutionCommentAction>(removeCommentReducer).call,
  TypedReducer<SolutionEntityState,AddNewSolutionCommentAction>(addNewCommentReducer).call,

  TypedReducer<SolutionEntityState,MarkSolutionAsCorrectSuccessAction>(markAsCorrectReducer).call,
  TypedReducer<SolutionEntityState,MarkSolutionAsIncorrectSuccessAction>(markAsIncorrectReducer).call,

  TypedReducer<SolutionEntityState,SaveSolutionSuccessAction>(saveSolutionReducer).call,
  TypedReducer<SolutionEntityState,UnsaveSolutionSuccessAction>(unsaveSolutionReducer).call,
]);