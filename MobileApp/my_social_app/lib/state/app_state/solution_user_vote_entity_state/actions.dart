import 'package:flutter/foundation.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/solution_user_vote_entity_state/solution_user_vote_state.dart';

@immutable
class AddSolutionUserVotesAction extends Action{
  final Iterable<SolutionUserVoteState> votes;
  const AddSolutionUserVotesAction({required this.votes});
}
@immutable
class AddSolutionUserVoteAction extends Action{
  final SolutionUserVoteState vote;
  const AddSolutionUserVoteAction({required this.vote});
}
@immutable
class RemoveSolutionUserVoteAction extends Action{
  final int voteId;
  const RemoveSolutionUserVoteAction({required this.voteId});
}