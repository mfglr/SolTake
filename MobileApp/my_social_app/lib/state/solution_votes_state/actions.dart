import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_social_app/state/actions.dart';
import 'package:my_social_app/state/solution_votes_state/solution_user_vote_state.dart';
import 'package:my_social_app/state/solutions_state/solution_state.dart';

@immutable
class MakeSolutionUpvoteAction extends AppAction{
  final SolutionState solution;
  const MakeSolutionUpvoteAction({required this.solution});
}
@immutable
class MakeSolutionUpvoteSuccessAction extends AppAction{
  final SolutionState solution;
  final SolutionUserVoteState solutionUserVote;
  const MakeSolutionUpvoteSuccessAction({
    required this.solution,
    required this.solutionUserVote
  });
}

@immutable 
class RemoveSolutionUpvoteAction extends AppAction{
  final SolutionState solution;
  const RemoveSolutionUpvoteAction({required this.solution});
}
@immutable
class RemoveSolutionUpvoteSuccessAction extends AppAction{
  final SolutionState solution;
  final int userId;
  const RemoveSolutionUpvoteSuccessAction({required this.solution,required this.userId});
}

@immutable
class NextSolutionUpvotesAction extends AppAction{
  final int solutionId;
  const NextSolutionUpvotesAction({required this.solutionId});
}
@immutable
class NextSolutionUpvotesSuccessAction extends AppAction{
  final int solutionId;
  final Iterable<SolutionUserVoteState> votes;
  const NextSolutionUpvotesSuccessAction({required this.solutionId, required this.votes});
}
@immutable
class NextSolutionUpvotesFailedAction extends AppAction{
  final int solutionId;
  const NextSolutionUpvotesFailedAction({required this.solutionId});
}

@immutable
class RefreshSolutionUpvotesAction extends AppAction{
  final int solutionId;
  const RefreshSolutionUpvotesAction({required this.solutionId});
}
@immutable
class RefreshSolutionUpvotesSuccessAction extends AppAction{
  final int solutionId;
  final Iterable<SolutionUserVoteState> votes;
  const RefreshSolutionUpvotesSuccessAction({required this.solutionId, required this.votes});
}
@immutable
class RefreshSolutionUpvotesFailedAction extends AppAction{
  final int solutionId;
  const RefreshSolutionUpvotesFailedAction({required this.solutionId});
}


@immutable
class MakeSolutionDownvoteAction extends AppAction{
  final SolutionState solution;
  const MakeSolutionDownvoteAction({required this.solution});
}
@immutable
class MakeSolutionDownvoteSuccessAction extends AppAction{
  final SolutionState solution;
  final SolutionUserVoteState solutionUserVote;
  const MakeSolutionDownvoteSuccessAction({
    required this.solution,
    required this.solutionUserVote,
  });
}

@immutable
class RemoveSolutionDownvoteAction extends AppAction{
  final SolutionState solution;
  const RemoveSolutionDownvoteAction({required this.solution});
}
@immutable
class RemoveSolutionDownvoteSuccessAction extends AppAction{
  final SolutionState solution;
  final int userId;
  const RemoveSolutionDownvoteSuccessAction({
    required this.solution,
    required this.userId
  });
}


@immutable
class NextSolutionDownvotesAction extends AppAction{
  final int solutionId;
  const NextSolutionDownvotesAction({required this.solutionId});
}
@immutable
class NextSolutionDownvotesSuccessAction extends AppAction{
  final int solutionId;
  final Iterable<SolutionUserVoteState> votes;
  const NextSolutionDownvotesSuccessAction({required this.solutionId, required this.votes});
}
@immutable
class NextSolutionDownvotesFailedAction extends AppAction{
  final int solutionId;
  const NextSolutionDownvotesFailedAction({required this.solutionId});
}

@immutable
class RefreshSolutionDownvotesAction extends AppAction{
  final int solutionId;
  const RefreshSolutionDownvotesAction({required this.solutionId});
}
@immutable
class RefreshSolutionDownvotesSuccessAction extends AppAction{
  final int solutionId;
  final Iterable<SolutionUserVoteState> votes;
  const RefreshSolutionDownvotesSuccessAction({required this.solutionId, required this.votes});
}
@immutable
class RefreshSolutionDownvotesFailedAction extends AppAction{
  final int solutionId;
  const RefreshSolutionDownvotesFailedAction({required this.solutionId});
}