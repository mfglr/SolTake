import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_user_vote_state.dart';
import 'package:my_social_app/views/solution/widgets/solution_user_vote/solution_user_vote_widget.dart';

class SolutionUserVotesWidget extends StatelessWidget {
  final Iterable<SolutionUserVoteState> solutionUserVotes;
  const SolutionUserVotesWidget({
    super.key,
    required this.solutionUserVotes
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: solutionUserVotes
        .mapIndexed(
          (index,solutionUserVote) =>
            solutionUserVotes.length - 1 == index
              ? SolutionUserVoteWidget(solutionUserVote: solutionUserVote)
              : Container(
                  margin: const EdgeInsets.only(bottom: 5),
                  child: SolutionUserVoteWidget(solutionUserVote: solutionUserVote),
                )
        )
        .toList(),
    );
  }
}