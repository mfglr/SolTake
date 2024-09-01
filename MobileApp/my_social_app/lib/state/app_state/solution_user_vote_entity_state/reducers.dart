import 'package:my_social_app/state/app_state/solution_user_vote_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/solution_user_vote_entity_state/solution_user_vote_entity_state.dart';
import 'package:redux/redux.dart';

SolutionUserVoteEntityState addVotesReducer(SolutionUserVoteEntityState prev, AddSolutionUserVotesAction action)
  => prev.addVotes(action.votes);
SolutionUserVoteEntityState addVoteReducer(SolutionUserVoteEntityState prev, AddSolutionUserVoteAction action)
  => prev.addVote(action.vote);
SolutionUserVoteEntityState removeVoteReducer(SolutionUserVoteEntityState prev,RemoveSolutionUserVoteAction action)
  => prev.removeVote(action.voteId);

Reducer<SolutionUserVoteEntityState> solutionUserVoteEntityReducers = combineReducers<SolutionUserVoteEntityState>([
  TypedReducer<SolutionUserVoteEntityState,AddSolutionUserVotesAction>(addVotesReducer).call,
  TypedReducer<SolutionUserVoteEntityState,AddSolutionUserVoteAction>(addVoteReducer).call,
  TypedReducer<SolutionUserVoteEntityState,RemoveSolutionUserVoteAction>(removeVoteReducer).call,
]);