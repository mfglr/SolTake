import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/state/app_state/solution_votes_state/solution_user_vote_state.dart';
import 'package:my_social_app/state/app_state/solution_votes_state/solution_votes_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';
import 'package:redux/redux.dart';

Pagination<int,SolutionUserVoteState> selectSolutionUpvotesFromState(SolutionVotesState state, int solutionId) =>
  state.upvotes[solutionId] ?? Pagination.init(usersPerPage, true);
Pagination<int,SolutionUserVoteState> selectSolutionUpvotes(Store<AppState> store, int solutionId) =>
  selectSolutionUpvotesFromState(store.state.solutionVotes, solutionId);
Future<bool> onSolutionUpvotesLoaded(Store<AppState> store, int solutionId) =>
  store.onChange.map((state) => !selectSolutionUpvotesFromState(state.solutionVotes, solutionId).loadingNext).first;

Pagination<int,SolutionUserVoteState> selectSolutionDownvotesFromState(SolutionVotesState state, int solutionId) =>
  state.downvotes[solutionId] ?? Pagination.init(usersPerPage, true);
Pagination<int,SolutionUserVoteState> selectSolutionDownvotes(Store<AppState> store, int solutionId) =>
  selectSolutionDownvotesFromState(store.state.solutionVotes, solutionId);
Future<bool> onSolutionDownvotesLoaded(Store<AppState> store, int solutionId) =>
  store.onChange.map((state) => !selectSolutionDownvotesFromState(state.solutionVotes, solutionId).loadingNext).first;
