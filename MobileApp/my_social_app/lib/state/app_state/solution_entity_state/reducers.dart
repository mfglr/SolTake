import 'package:my_social_app/state/app_state/solution_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/state/entity_state/entity_state.dart';
import 'package:redux/redux.dart';

EntityState<num,SolutionState> addSolutionReducer(EntityState<num,SolutionState> prev, AddSolutionAction action)
  => prev.appendOne(action.solution);
EntityState<num,SolutionState> addSolutionsReducer(EntityState<num,SolutionState> prev, AddSolutionsAction action)
  => prev.appendMany(action.solutions);
EntityState<num,SolutionState> removeSolutionReducer(EntityState<num,SolutionState> prev,RemoveSolutionSuccessAction action)
  => prev.where((e) => e.id != action.solutionId);

EntityState<num,SolutionState> nextUpvotesReducer(EntityState<num,SolutionState> prev,NextSolutionUpvotesAction action)
  =>  prev.updateOne(prev.getValue(action.solutionId)!.startLoadingNextUpvotes());
EntityState<num,SolutionState> nextUpvotesSuccessReducer(EntityState<num,SolutionState> prev,NextSolutionUpvotesSuccessAction action)
  => prev.updateOne(prev.getValue(action.solutionId)!.addNextUpvotes(action.voteIds));
EntityState<num,SolutionState> nextUpvotesFailedReducer(EntityState<num,SolutionState> prev,NextSolutionUpvotesFailedAction action)
  => prev.updateOne(prev.getValue(action.solutionId)!.stopLoadingNextUpvotes());

EntityState<num,SolutionState> makeUpvoteReducer(EntityState<num,SolutionState> prev,MakeSolutionUpvoteSuccessAction action)
  => prev.updateOne(prev.getValue(action.solutionId)!.makeUpvote(action.upvoteId,action.downvoteId));
EntityState<num,SolutionState> removeUpvoteReducer(EntityState<num,SolutionState> prev,RemoveSolutionUpvoteSuccessAction action)
  => prev.updateOne(prev.getValue(action.solutionId)!.removeUpvote(action.voteId));
EntityState<num,SolutionState> addNewSolutionUpvoteReducer(EntityState<num,SolutionState> prev,AddNewSolutionUpvoteAction action)
  => prev.updateOne(prev.getValue(action.solutionId)!.addNewUpvote(action.voteId));

EntityState<num,SolutionState> nextDownvotesReducer(EntityState<num,SolutionState> prev,NextSolutionDownvotesAction action)
  => prev.updateOne(prev.getValue(action.solutionId)!.startLoadingNextDownvotes());
EntityState<num,SolutionState> nextDownvotesSuccessReducer(EntityState<num,SolutionState> prev,NextSolutionDownvotesSuccessAction action)
  => prev.updateOne(prev.getValue(action.solutionId)!.addNextDownvotes(action.voteIds)) ;
EntityState<num,SolutionState> nextDownvotesFailedReducer(EntityState<num,SolutionState> prev,NextSolutionDownvotesFailedAction action)
  => prev.updateOne(prev.getValue(action.solutionId)!.stopLoadingNextDownvotes());

EntityState<num,SolutionState> makeDownvoteReducer(EntityState<num,SolutionState> prev,MakeSolutionDownvoteSuccessAction action)
  => prev.updateOne(prev.getValue(action.solutionId)!.makeDownvote(action.upvoteId,action.downvoteId));
EntityState<num,SolutionState> removeDownVoteAction(EntityState<num,SolutionState> prev,RemoveSolutionDownvoteSuccessAction action)
  => prev.updateOne(prev.getValue(action.solutionId)!.removeDownvote(action.voteId));
EntityState<num,SolutionState> addNewSolutionDownvoteReducer(EntityState<num,SolutionState> prev,AddNewSolutionDownvoteAction action)
  => prev.updateOne(prev.getValue(action.solutionId)!.addNewDownvote(action.voteId));

EntityState<num,SolutionState> nextCommentsReducer(EntityState<num,SolutionState> prev,NextSolutionCommentsAction action)
  => prev.updateOne(prev.getValue(action.solutionId)!.startLoadingNextComments());
EntityState<num,SolutionState> nextCommentsSuccessReducer(EntityState<num,SolutionState> prev, NextSolutionCommentsSuccessAction action)
  => prev.updateOne(prev.getValue(action.solutionId)!.addNextComments(action.commentsIds));
EntityState<num,SolutionState> nextCommentsFailedReducer(EntityState<num,SolutionState> prev,NextSolutionCommentsFailedAction action)
  => prev.updateOne(prev.getValue(action.solutionId)!.stopLoadingNextComments());

EntityState<num,SolutionState> addCommentReducer(EntityState<num,SolutionState> prev,AddSolutionCommentAction action)
  => prev.updateOne(prev.getValue(action.solutionId)!.addComment(action.commentId));
EntityState<num,SolutionState> removeCommentReducer(EntityState<num,SolutionState> prev,RemoveSolutionCommentAction action)
  => prev.updateOne(prev.getValue(action.solutionId)!.removeComment(action.commentId));
EntityState<num,SolutionState> addNewCommentReducer(EntityState<num,SolutionState> prev,AddNewSolutionCommentAction action)
  => prev.updateOne(prev.getValue(action.solutionId)!.addNewComment(action.commentId));

EntityState<num,SolutionState> markAsCorrectReducer(EntityState<num,SolutionState> prev, MarkSolutionAsCorrectSuccessAction action)
  => prev.updateOne(prev.getValue(action.solutionId)!.markAsCorrect()) ;
EntityState<num,SolutionState> markAsIncorrectReducer(EntityState<num,SolutionState> prev, MarkSolutionAsIncorrectSuccessAction action)
  => prev.updateOne(prev.getValue(action.solutionId)!.markAsIncorrect());

EntityState<num,SolutionState> saveSolutionReducer(EntityState<num,SolutionState> prev, SaveSolutionSuccessAction action)
  => prev.updateOne(prev.getValue(action.solutionId)!.save()) ;
EntityState<num,SolutionState> unsaveSolutionReducer(EntityState<num,SolutionState> prev, UnsaveSolutionSuccessAction action)
  => prev.updateOne(prev.getValue(action.solutionId)!.unsave());

Reducer<EntityState<num,SolutionState>> solutionEntityStateReducers = combineReducers<EntityState<num,SolutionState>>([
  TypedReducer<EntityState<num,SolutionState>,AddSolutionAction>(addSolutionReducer).call,
  TypedReducer<EntityState<num,SolutionState>,AddSolutionsAction>(addSolutionsReducer).call,
  TypedReducer<EntityState<num,SolutionState>,RemoveSolutionSuccessAction>(removeSolutionReducer).call,
  TypedReducer<EntityState<num,SolutionState>,MakeSolutionUpvoteSuccessAction>(makeUpvoteReducer).call,
  TypedReducer<EntityState<num,SolutionState>,RemoveSolutionUpvoteSuccessAction>(removeUpvoteReducer).call,
  TypedReducer<EntityState<num,SolutionState>,AddNewSolutionUpvoteAction>(addNewSolutionUpvoteReducer).call,
  TypedReducer<EntityState<num,SolutionState>,MakeSolutionDownvoteSuccessAction>(makeDownvoteReducer).call,
  TypedReducer<EntityState<num,SolutionState>,RemoveSolutionDownvoteSuccessAction>(removeDownVoteAction).call,
  TypedReducer<EntityState<num,SolutionState>,AddNewSolutionDownvoteAction>(addNewSolutionDownvoteReducer).call,

  TypedReducer<EntityState<num,SolutionState>,NextSolutionUpvotesAction>(nextUpvotesReducer).call,
  TypedReducer<EntityState<num,SolutionState>,NextSolutionUpvotesSuccessAction>(nextUpvotesSuccessReducer).call,
  TypedReducer<EntityState<num,SolutionState>,NextSolutionUpvotesFailedAction>(nextUpvotesFailedReducer).call,

  TypedReducer<EntityState<num,SolutionState>,NextSolutionDownvotesAction>(nextDownvotesReducer).call,
  TypedReducer<EntityState<num,SolutionState>,NextSolutionDownvotesSuccessAction>(nextDownvotesSuccessReducer).call,
  TypedReducer<EntityState<num,SolutionState>,NextSolutionDownvotesFailedAction>(nextDownvotesFailedReducer).call,

  TypedReducer<EntityState<num,SolutionState>,NextSolutionCommentsAction>(nextCommentsReducer).call,
  TypedReducer<EntityState<num,SolutionState>,NextSolutionCommentsSuccessAction>(nextCommentsSuccessReducer).call,
  TypedReducer<EntityState<num,SolutionState>,NextSolutionCommentsFailedAction>(nextCommentsFailedReducer).call,

  TypedReducer<EntityState<num,SolutionState>,AddSolutionCommentAction>(addCommentReducer).call,
  TypedReducer<EntityState<num,SolutionState>,RemoveSolutionCommentAction>(removeCommentReducer).call,
  TypedReducer<EntityState<num,SolutionState>,AddNewSolutionCommentAction>(addNewCommentReducer).call,

  TypedReducer<EntityState<num,SolutionState>,MarkSolutionAsCorrectSuccessAction>(markAsCorrectReducer).call,
  TypedReducer<EntityState<num,SolutionState>,MarkSolutionAsIncorrectSuccessAction>(markAsIncorrectReducer).call,

  TypedReducer<EntityState<num,SolutionState>,SaveSolutionSuccessAction>(saveSolutionReducer).call,
  TypedReducer<EntityState<num,SolutionState>,UnsaveSolutionSuccessAction>(unsaveSolutionReducer).call,
]);