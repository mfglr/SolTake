import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_user_vote_state.dart';
import 'package:my_social_app/views/shared/user_item/user_item_widget.dart';


class SolutionUserVoteWidget extends StatelessWidget {
  final SolutionUserVoteState solutionUserVote;
  
  const SolutionUserVoteWidget({
    super.key,
    required this.solutionUserVote
  });

  @override
  Widget build(BuildContext context) => UserItemWidget(userItem: solutionUserVote);
}