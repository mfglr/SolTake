import 'package:flutter/material.dart';
import 'package:my_social_app/state/solution_entity_state/solution_state.dart';

class SolutionCommentButton extends StatelessWidget {
  final SolutionState solution;
  const SolutionCommentButton({super.key,required this.solution});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (){},
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 5),
            child: const Icon(Icons.mode_comment_outlined)
          ),
          const Text("56")
        ],
      )
    );
  }
}