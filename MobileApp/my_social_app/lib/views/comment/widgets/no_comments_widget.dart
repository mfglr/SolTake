import 'package:flutter/material.dart';
import 'package:my_social_app/state/create_comment_state/create_comment_state.dart';

class NoCommentsWidget extends StatelessWidget {
  final CreateCommentState state;
  const NoCommentsWidget({
    super.key,
    required this.state
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "No Comments",
          style: TextStyle(fontSize: 40),
          textAlign: TextAlign.center,
        ),
        Text(
          "Make first comment on this ${state.question != null ? 'question' : 'solution'}",
          style: const TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}