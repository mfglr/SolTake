import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_user_vote_state.dart';
import 'package:my_social_app/views/shared/app_column.dart';
import 'package:my_social_app/views/shared/user_item/user_item_widget.dart';
import 'package:my_social_app/views/user/pages/user_page/pages/user_page/user_page.dart';

class SolutionUserVotesWidget extends StatelessWidget {
  final Iterable<SolutionUserVoteState> solutionUserVotes;
  const SolutionUserVotesWidget({
    super.key,
    required this.solutionUserVotes
  });

  @override
  Widget build(BuildContext context)
    => AppColumn(
        children: solutionUserVotes.map((e) =>  UserItemWidget(
          userItem: e,
          onPressed: () =>
            Navigator
              .of(context)
              .push(MaterialPageRoute(builder: (context) => UserPage(userId: e.userId))),
        ))
      );
}