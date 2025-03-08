import 'package:my_social_app/state/app_state/solution_user_vote_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/solution_user_vote_entity_state/solution_user_vote_state.dart';
import 'package:my_social_app/state/entity_state/entity_state.dart';
import 'package:redux/redux.dart';

EntityState<int,SolutionUserVoteState> addVotesReducer(EntityState<int,SolutionUserVoteState> prev, AddSolutionUserVotesAction action)
  => prev.appendMany(action.votes);
EntityState<int,SolutionUserVoteState> addVoteReducer(EntityState<int,SolutionUserVoteState> prev, AddSolutionUserVoteAction action)
  => prev.appendOne(action.vote);
EntityState<int,SolutionUserVoteState> removeVoteReducer(EntityState<int,SolutionUserVoteState> prev,RemoveSolutionUserVoteAction action)
  => prev.removeOne(action.voteId);

Reducer<EntityState<int,SolutionUserVoteState>> solutionUserVoteEntityReducers = combineReducers<EntityState<int,SolutionUserVoteState>>([
  TypedReducer<EntityState<int,SolutionUserVoteState>,AddSolutionUserVotesAction>(addVotesReducer).call,
  TypedReducer<EntityState<int,SolutionUserVoteState>,AddSolutionUserVoteAction>(addVoteReducer).call,
  TypedReducer<EntityState<int,SolutionUserVoteState>,RemoveSolutionUserVoteAction>(removeVoteReducer).call,
]);