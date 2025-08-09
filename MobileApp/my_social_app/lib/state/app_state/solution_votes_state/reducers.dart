import 'package:my_social_app/state/app_state/solution_votes_state/actions.dart';
import 'package:my_social_app/state/app_state/solution_votes_state/solution_votes_state.dart';
import 'package:redux/redux.dart';

SolutionVotesState makeSolutionUpvoteReducer(SolutionVotesState prev, MakeSolutionUpvoteSuccessAction action) =>
  prev.makeUpvote(action.solution, action.solutionUserVote);
SolutionVotesState removeSolutionUpvoteReducer(SolutionVotesState prev, RemoveSolutionUpvoteSuccessAction action) =>
  prev.removeUpvote(action.solution, action.userId);

SolutionVotesState nextSolutionUpvotesReducer(SolutionVotesState prev, NextSolutionUpvotesAction action) =>
  prev.startNextUpvotes(action.solutionId);
SolutionVotesState nextSolutionUpvotesSuccessReducer(SolutionVotesState prev, NextSolutionUpvotesSuccessAction action) =>
  prev.addNextUpvotes(action.solutionId,action.votes);
SolutionVotesState nextSolutionUpvotesFailedReducer(SolutionVotesState prev, NextSolutionUpvotesFailedAction action) =>
  prev.stopNextUpvotes(action.solutionId);

SolutionVotesState refreshSolutionUpvotesReducer(SolutionVotesState prev, RefreshSolutionUpvotesAction action) =>
  prev.startNextUpvotes(action.solutionId);
SolutionVotesState refreshSolutionUpvotesSuccessReducer(SolutionVotesState prev, RefreshSolutionUpvotesSuccessAction action) =>
  prev.refreshUpvotes(action.solutionId,action.votes);
SolutionVotesState refreshSolutionUpvotesFailedReducer(SolutionVotesState prev, RefreshSolutionUpvotesFailedAction action) =>
  prev.stopNextUpvotes(action.solutionId);


SolutionVotesState makeSolutionDownvoteReducer(SolutionVotesState prev, MakeSolutionDownvoteSuccessAction action) =>
  prev.makeDownvote(action.solution, action.solutionUserVote);
SolutionVotesState removeSolutionDownvoteReducer(SolutionVotesState prev, RemoveSolutionDownvoteSuccessAction action) =>
  prev.removeDownvote(action.solution, action.userId);

SolutionVotesState nextSolutionDownvotesReducer(SolutionVotesState prev, NextSolutionDownvotesAction action) =>
  prev.startNextDownvotes(action.solutionId);
SolutionVotesState nextSolutionDownvotesSuccessReducer(SolutionVotesState prev, NextSolutionDownvotesSuccessAction action) =>
  prev.addNextDownvotes(action.solutionId,action.votes);
SolutionVotesState nextSolutionDownvotesFailedReducer(SolutionVotesState prev, NextSolutionDownvotesFailedAction action) =>
  prev.stopNextDownvotes(action.solutionId);

SolutionVotesState refreshSolutionDownvotesReducer(SolutionVotesState prev, RefreshSolutionDownvotesAction action) =>
  prev.startNextDownvotes(action.solutionId);
SolutionVotesState refreshSolutionDownvotesSuccessReducer(SolutionVotesState prev, RefreshSolutionDownvotesSuccessAction action) =>
  prev.refreshDownvotes(action.solutionId,action.votes);
SolutionVotesState refreshSolutionDownvotesFailedReducer(SolutionVotesState prev, RefreshSolutionDownvotesFailedAction action) =>
  prev.stopNextDownvotes(action.solutionId);

Reducer<SolutionVotesState> solutionUserVotesReducers = combineReducers<SolutionVotesState>([
  TypedReducer<SolutionVotesState, MakeSolutionUpvoteSuccessAction>(makeSolutionUpvoteReducer).call,
  TypedReducer<SolutionVotesState, RemoveSolutionUpvoteSuccessAction>(removeSolutionUpvoteReducer).call,
  
  TypedReducer<SolutionVotesState, NextSolutionUpvotesAction>(nextSolutionUpvotesReducer).call,
  TypedReducer<SolutionVotesState, NextSolutionUpvotesSuccessAction>(nextSolutionUpvotesSuccessReducer).call,
  TypedReducer<SolutionVotesState, NextSolutionUpvotesFailedAction>(nextSolutionUpvotesFailedReducer).call,
  
  TypedReducer<SolutionVotesState, RefreshSolutionUpvotesAction>(refreshSolutionUpvotesReducer).call,
  TypedReducer<SolutionVotesState, RefreshSolutionUpvotesSuccessAction>(refreshSolutionUpvotesSuccessReducer).call,
  TypedReducer<SolutionVotesState, RefreshSolutionUpvotesFailedAction>(refreshSolutionUpvotesFailedReducer).call,


  TypedReducer<SolutionVotesState, MakeSolutionDownvoteSuccessAction>(makeSolutionDownvoteReducer).call,
  TypedReducer<SolutionVotesState, RemoveSolutionDownvoteSuccessAction>(removeSolutionDownvoteReducer).call,
  
  TypedReducer<SolutionVotesState, NextSolutionDownvotesAction>(nextSolutionDownvotesReducer).call,
  TypedReducer<SolutionVotesState, NextSolutionDownvotesSuccessAction>(nextSolutionDownvotesSuccessReducer).call,
  TypedReducer<SolutionVotesState, NextSolutionDownvotesFailedAction>(nextSolutionDownvotesFailedReducer).call,
  
  TypedReducer<SolutionVotesState, RefreshSolutionDownvotesAction>(refreshSolutionDownvotesReducer).call,
  TypedReducer<SolutionVotesState, RefreshSolutionDownvotesSuccessAction>(refreshSolutionDownvotesSuccessReducer).call,
  TypedReducer<SolutionVotesState, RefreshSolutionDownvotesFailedAction>(refreshSolutionDownvotesFailedReducer).call,
]);