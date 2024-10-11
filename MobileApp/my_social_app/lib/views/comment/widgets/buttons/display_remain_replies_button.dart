import 'package:flutter/material.dart';
import 'package:my_social_app/helpers/actionDispathcers.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/comment_state.dart';
import 'package:my_social_app/state/app_state/store.dart';

class DisplayRemainRepliesButton extends StatelessWidget {
  final CommentState comment;
  const DisplayRemainRepliesButton({super.key,required this.comment});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => getNextPageIfReady(store,comment.replies,NextCommentRepliesAction(commentId: comment.id)),
      style: ButtonStyle(
        padding: WidgetStateProperty.all(EdgeInsets.zero),
        minimumSize: WidgetStateProperty.all(const Size(0, 0)),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 5),
            child: const Icon(Icons.reply,size: 18)
          ),
          Text(
            comment.numberOfNotDisplayedReplies.toString(),
            style: const TextStyle(fontSize: 11),
          )
        ],
      ),
    );
  }
}