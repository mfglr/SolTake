import 'package:flutter/material.dart';
import 'package:my_social_app/state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/views/shared/solution/downvote_button_widget.dart';
import 'package:my_social_app/views/shared/solution/solution_comment_button.dart';
import 'package:my_social_app/views/shared/solution/upvote_button_widget.dart';

class SolutionButtonsWidget extends StatelessWidget {
  final SolutionState solution;
  const SolutionButtonsWidget({super.key,required this.solution});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Builder(
          builder: (context) {
            if(!solution.isOwner)return UpvoteButtonWidget(solution: solution);
            return const SizedBox.shrink();
          }
        ),
        Builder(
          builder: (context) {
            if(!solution.isOwner)return DownvoteButtonWidget(solution: solution);
            return const SizedBox.shrink();
          }
        ),
        SolutionCommentButton(solution: solution)
      ]
    );
  }
}