import 'package:my_social_app/state/app_state/solution_user_vote_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/solution_user_vote_entity_state/solution_user_vote_state.dart';
import 'package:my_social_app/state/entity_state/entity_state.dart';
import 'package:redux/redux.dart';

EntityState<num,SolutionUserVoteState> addVotesReducer(EntityState<num,SolutionUserVoteState> prev, AddSolutionUserVotesAction action)
  => prev.appendMany(action.votes);
EntityState<num,SolutionUserVoteState> addVoteReducer(EntityState<num,SolutionUserVoteState> prev, AddSolutionUserVoteAction action)
  => prev.appendOne(action.vote);
EntityState<num,SolutionUserVoteState> removeVoteReducer(EntityState<num,SolutionUserVoteState> prev,RemoveSolutionUserVoteAction action)
  => prev.removeOne(action.voteId);

Reducer<EntityState<num,SolutionUserVoteState>> solutionUserVoteEntityReducers = combineReducers<EntityState<num,SolutionUserVoteState>>([
  TypedReducer<EntityState<num,SolutionUserVoteState>,AddSolutionUserVotesAction>(addVotesReducer).call,
  TypedReducer<EntityState<num,SolutionUserVoteState>,AddSolutionUserVoteAction>(addVoteReducer).call,
  TypedReducer<EntityState<num,SolutionUserVoteState>,RemoveSolutionUserVoteAction>(removeVoteReducer).call,
]);