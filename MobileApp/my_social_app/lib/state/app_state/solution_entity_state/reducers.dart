import 'package:my_social_app/state/app_state/solution_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/state/entity_state/entity_state.dart';
import 'package:redux/redux.dart';

EntityState<int,SolutionState> addSolutionReducer(EntityState<int,SolutionState> prev, AddSolutionAction action)
  => prev.appendOne(action.solution);
EntityState<int,SolutionState> addSolutionsReducer(EntityState<int,SolutionState> prev, AddSolutionsAction action)
  => prev.appendMany(action.solutions);
EntityState<int,SolutionState> removeSolutionReducer(EntityState<int,SolutionState> prev,RemoveSolutionSuccessAction action)
  => prev.where((e) => e.id != action.solutionId);

EntityState<int,SolutionState> nextUpvotesReducer(EntityState<int,SolutionState> prev,NextSolutionUpvotesAction action)
  =>  prev.updateOne(prev.getValue(action.solutionId)!.startLoadingNextUpvotes());
EntityState<int,SolutionState> nextUpvotesSuccessReducer(EntityState<int,SolutionState> prev,NextSolutionUpvotesSuccessAction action)
  => prev.updateOne(prev.getValue(action.solutionId)!.addNextUpvotes(action.voteIds));
EntityState<int,SolutionState> nextUpvotesFailedReducer(EntityState<int,SolutionState> prev,NextSolutionUpvotesFailedAction action)
  => prev.updateOne(prev.getValue(action.solutionId)!.stopLoadingNextUpvotes());

EntityState<int,SolutionState> makeUpvoteReducer(EntityState<int,SolutionState> prev,MakeSolutionUpvoteSuccessAction action)
  => prev.updateOne(prev.getValue(action.solutionId)!.makeUpvote(action.upvoteId,action.downvoteId));
EntityState<int,SolutionState> removeUpvoteReducer(EntityState<int,SolutionState> prev,RemoveSolutionUpvoteSuccessAction action)
  => prev.updateOne(prev.getValue(action.solutionId)!.removeUpvote(action.voteId));
EntityState<int,SolutionState> addNewSolutionUpvoteReducer(EntityState<int,SolutionState> prev,AddNewSolutionUpvoteAction action)
  => prev.updateOne(prev.getValue(action.solutionId)!.addNewUpvote(action.voteId));

EntityState<int,SolutionState> nextDownvotesReducer(EntityState<int,SolutionState> prev,NextSolutionDownvotesAction action)
  => prev.updateOne(prev.getValue(action.solutionId)!.startLoadingNextDownvotes());
EntityState<int,SolutionState> nextDownvotesSuccessReducer(EntityState<int,SolutionState> prev,NextSolutionDownvotesSuccessAction action)
  => prev.updateOne(prev.getValue(action.solutionId)!.addNextDownvotes(action.voteIds)) ;
EntityState<int,SolutionState> nextDownvotesFailedReducer(EntityState<int,SolutionState> prev,NextSolutionDownvotesFailedAction action)
  => prev.updateOne(prev.getValue(action.solutionId)!.stopLoadingNextDownvotes());

EntityState<int,SolutionState> makeDownvoteReducer(EntityState<int,SolutionState> prev,MakeSolutionDownvoteSuccessAction action)
  => prev.updateOne(prev.getValue(action.solutionId)!.makeDownvote(action.upvoteId,action.downvoteId));
EntityState<int,SolutionState> removeDownVoteAction(EntityState<int,SolutionState> prev,RemoveSolutionDownvoteSuccessAction action)
  => prev.updateOne(prev.getValue(action.solutionId)!.removeDownvote(action.voteId));
EntityState<int,SolutionState> addNewSolutionDownvoteReducer(EntityState<int,SolutionState> prev,AddNewSolutionDownvoteAction action)
  => prev.updateOne(prev.getValue(action.solutionId)!.addNewDownvote(action.voteId));

EntityState<int,SolutionState> nextCommentsReducer(EntityState<int,SolutionState> prev,NextSolutionCommentsAction action)
  => prev.updateOne(prev.getValue(action.solutionId)!.startLoadingNextComments());
EntityState<int,SolutionState> nextCommentsSuccessReducer(EntityState<int,SolutionState> prev, NextSolutionCommentsSuccessAction action)
  => prev.updateOne(prev.getValue(action.solutionId)!.addNextComments(action.commentsIds));
EntityState<int,SolutionState> nextCommentsFailedReducer(EntityState<int,SolutionState> prev,NextSolutionCommentsFailedAction action)
  => prev.updateOne(prev.getValue(action.solutionId)!.stopLoadingNextComments());

EntityState<int,SolutionState> addCommentReducer(EntityState<int,SolutionState> prev,AddSolutionCommentAction action)
  => prev.updateOne(prev.getValue(action.solutionId)!.addComment(action.commentId));
EntityState<int,SolutionState> removeCommentReducer(EntityState<int,SolutionState> prev,RemoveSolutionCommentAction action)
  => prev.updateOne(prev.getValue(action.solutionId)!.removeComment(action.commentId));
EntityState<int,SolutionState> addNewCommentReducer(EntityState<int,SolutionState> prev,AddNewSolutionCommentAction action)
  => prev.updateOne(prev.getValue(action.solutionId)!.addNewComment(action.commentId));

EntityState<int,SolutionState> markAsCorrectReducer(EntityState<int,SolutionState> prev, MarkSolutionAsCorrectSuccessAction action)
  => prev.updateOne(prev.getValue(action.solutionId)!.markAsCorrect()) ;
EntityState<int,SolutionState> markAsIncorrectReducer(EntityState<int,SolutionState> prev, MarkSolutionAsIncorrectSuccessAction action)
  => prev.updateOne(prev.getValue(action.solutionId)!.markAsIncorrect());

EntityState<int,SolutionState> saveSolutionReducer(EntityState<int,SolutionState> prev, SaveSolutionAction action)
  => prev.updateOne(prev.getValue(action.solutionId)!.save()) ;
EntityState<int,SolutionState> unsaveSolutionReducer(EntityState<int,SolutionState> prev, UnsaveSolutionAction action)
  => prev.updateOne(prev.getValue(action.solutionId)!.unsave());

Reducer<EntityState<int,SolutionState>> solutionEntityStateReducers = combineReducers<EntityState<int,SolutionState>>([
  TypedReducer<EntityState<int,SolutionState>,AddSolutionAction>(addSolutionReducer).call,
  TypedReducer<EntityState<int,SolutionState>,AddSolutionsAction>(addSolutionsReducer).call,
  TypedReducer<EntityState<int,SolutionState>,RemoveSolutionSuccessAction>(removeSolutionReducer).call,
  TypedReducer<EntityState<int,SolutionState>,MakeSolutionUpvoteSuccessAction>(makeUpvoteReducer).call,
  TypedReducer<EntityState<int,SolutionState>,RemoveSolutionUpvoteSuccessAction>(removeUpvoteReducer).call,
  TypedReducer<EntityState<int,SolutionState>,AddNewSolutionUpvoteAction>(addNewSolutionUpvoteReducer).call,
  TypedReducer<EntityState<int,SolutionState>,MakeSolutionDownvoteSuccessAction>(makeDownvoteReducer).call,
  TypedReducer<EntityState<int,SolutionState>,RemoveSolutionDownvoteSuccessAction>(removeDownVoteAction).call,
  TypedReducer<EntityState<int,SolutionState>,AddNewSolutionDownvoteAction>(addNewSolutionDownvoteReducer).call,

  TypedReducer<EntityState<int,SolutionState>,NextSolutionUpvotesAction>(nextUpvotesReducer).call,
  TypedReducer<EntityState<int,SolutionState>,NextSolutionUpvotesSuccessAction>(nextUpvotesSuccessReducer).call,
  TypedReducer<EntityState<int,SolutionState>,NextSolutionUpvotesFailedAction>(nextUpvotesFailedReducer).call,

  TypedReducer<EntityState<int,SolutionState>,NextSolutionDownvotesAction>(nextDownvotesReducer).call,
  TypedReducer<EntityState<int,SolutionState>,NextSolutionDownvotesSuccessAction>(nextDownvotesSuccessReducer).call,
  TypedReducer<EntityState<int,SolutionState>,NextSolutionDownvotesFailedAction>(nextDownvotesFailedReducer).call,

  TypedReducer<EntityState<int,SolutionState>,NextSolutionCommentsAction>(nextCommentsReducer).call,
  TypedReducer<EntityState<int,SolutionState>,NextSolutionCommentsSuccessAction>(nextCommentsSuccessReducer).call,
  TypedReducer<EntityState<int,SolutionState>,NextSolutionCommentsFailedAction>(nextCommentsFailedReducer).call,

  TypedReducer<EntityState<int,SolutionState>,AddSolutionCommentAction>(addCommentReducer).call,
  TypedReducer<EntityState<int,SolutionState>,RemoveSolutionCommentAction>(removeCommentReducer).call,
  TypedReducer<EntityState<int,SolutionState>,AddNewSolutionCommentAction>(addNewCommentReducer).call,

  TypedReducer<EntityState<int,SolutionState>,MarkSolutionAsCorrectSuccessAction>(markAsCorrectReducer).call,
  TypedReducer<EntityState<int,SolutionState>,MarkSolutionAsIncorrectSuccessAction>(markAsIncorrectReducer).call,

  TypedReducer<EntityState<int,SolutionState>,SaveSolutionAction>(saveSolutionReducer).call,
  TypedReducer<EntityState<int,SolutionState>,UnsaveSolutionAction>(unsaveSolutionReducer).call,
]);