import 'package:flutter/material.dart';
import 'package:my_social_app/state/solution_votes_state/selectors.dart';
import 'package:my_social_app/state/solution_votes_state/solution_user_vote_state.dart';
import 'package:my_social_app/state/solutions_state/solution_state.dart';
import 'package:my_social_app/custom_packages/entity_state/map_extentions.dart';
import 'package:my_social_app/custom_packages/entity_state/pagination.dart';

@immutable
class SolutionVotesState {
  final Map<int, Pagination<int, SolutionUserVoteState>> upvotes;
  final Map<int, Pagination<int, SolutionUserVoteState>> downvotes;

  const SolutionVotesState({
    required this.upvotes,
    required this.downvotes
  });

  SolutionVotesState makeUpvote(SolutionState solution, SolutionUserVoteState vote) =>
    SolutionVotesState(
      upvotes: upvotes.setOne(
        solution.id,
        selectSolutionUpvotesFromState(this,solution.id).addOne(vote)
      ),
      downvotes: downvotes.setOne(
        solution.id,
        downvotes[solution.id]?.where((e) => e.userId != vote.userId)
      )
    );
  SolutionVotesState removeUpvote(SolutionState solution, int userId) =>
    SolutionVotesState(
      upvotes: upvotes.setOne(
        solution.id,
        upvotes[solution.id]?.where((e) => e.userId != userId)
      ),
      downvotes: downvotes
    );
  SolutionVotesState startNextUpvotes(int solutionId) =>
    SolutionVotesState(
      upvotes: upvotes.setOne(
        solutionId,
        selectSolutionUpvotesFromState(this, solutionId).startLoadingNext()
      ),
      downvotes: downvotes
    );
  SolutionVotesState addNextUpvotes(int solutionId, Iterable<SolutionUserVoteState> votes) =>
    SolutionVotesState(
      upvotes: upvotes.setOne(
        solutionId,
        selectSolutionUpvotesFromState(this, solutionId).addNextPage(votes)
      ),
      downvotes: downvotes
    );
  SolutionVotesState refreshUpvotes(int solutionId, Iterable<SolutionUserVoteState> votes) =>
    SolutionVotesState(
      upvotes: upvotes.setOne(
        solutionId,
        selectSolutionUpvotesFromState(this, solutionId).refreshPage(votes)
      ),
      downvotes: downvotes
    );
  SolutionVotesState stopNextUpvotes(int solutionId) =>
    SolutionVotesState(
      upvotes: upvotes.setOne(
        solutionId,
        selectSolutionUpvotesFromState(this, solutionId).stopLoadingNext()
      ),
      downvotes: downvotes
    );

  SolutionVotesState makeDownvote(SolutionState solution, SolutionUserVoteState vote) =>
    SolutionVotesState(
      upvotes: upvotes.setOne(
        solution.id,
        upvotes[solution.id]?.where((e) => e.userId != vote.userId)
      ),
      downvotes: downvotes.setOne(
        solution.id,
        selectSolutionDownvotesFromState(this, solution.id).addOne(vote)
      ),
    );
  SolutionVotesState removeDownvote(SolutionState solution, int userId) =>
    SolutionVotesState(
      upvotes: upvotes,
      downvotes: downvotes.setOne(
        solution.id,
        downvotes[solution.id]?.where((e) => e.userId != userId)
      ),
    );

  SolutionVotesState startNextDownvotes(int solutionId) =>
    SolutionVotesState(
      upvotes: upvotes,
      downvotes: downvotes.setOne(
        solutionId,
        selectSolutionDownvotesFromState(this, solutionId).startLoadingNext()
      ),
    );
  SolutionVotesState addNextDownvotes(int solutionId, Iterable<SolutionUserVoteState> votes) =>
    SolutionVotesState(
      upvotes: upvotes,
      downvotes: downvotes.setOne(
        solutionId,
        selectSolutionDownvotesFromState(this, solutionId).addNextPage(votes)
      ),
    );
  SolutionVotesState refreshDownvotes(int solutionId, Iterable<SolutionUserVoteState> votes) =>
    SolutionVotesState(
      upvotes: upvotes,
      downvotes: downvotes.setOne(
        solutionId,
        selectSolutionDownvotesFromState(this, solutionId).refreshPage(votes)
      ),
    );
  SolutionVotesState stopNextDownvotes(int solutionId) =>
    SolutionVotesState(
      upvotes: upvotes,
      downvotes: downvotes.setOne(
        solutionId,
        selectSolutionDownvotesFromState(this, solutionId).stopLoadingNext()
      ),
    );

}