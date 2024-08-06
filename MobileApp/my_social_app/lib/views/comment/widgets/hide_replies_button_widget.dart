import 'package:flutter/material.dart';
import 'package:my_social_app/state/comment_entity_state/actions.dart';
import 'package:my_social_app/state/comment_entity_state/comment_state.dart';
import 'package:my_social_app/state/store.dart';

class HideRepliesButtonWidget extends StatelessWidget {
  final CommentState comment;
  const HideRepliesButtonWidget({super.key,required this.comment});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed:() => store.dispatch(ChangeRepliesVisibilityAction(commentId: comment.id, visibility: false)),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 5),
            child: const Icon( Icons.visibility_off_outlined,size: 20),
          ),
          const Text("Hide replies", style: TextStyle(fontSize: 12)),
        ],
      )
    );
  }
}