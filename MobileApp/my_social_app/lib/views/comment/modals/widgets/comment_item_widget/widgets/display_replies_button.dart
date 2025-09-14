import 'package:flutter/material.dart';
import 'package:my_social_app/state/comments_state/comment_state.dart';

class DisplayRepliesButton extends StatelessWidget {
  final CommentState comment;
  final bool isVisible;
  final void Function() onPressed;
  const DisplayRepliesButton({
    super.key,
    required this.comment,
    required this.onPressed,
    required this.isVisible
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: WidgetStateProperty.all(EdgeInsets.zero),
        minimumSize: WidgetStateProperty.all(const Size(0, 0)),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 3),
            child: const Icon(Icons.reply,size: 18)
          ),
          Text(
            "${comment.numberOfChildren}",
            style: const TextStyle(fontSize: 11),
          )
        ],
      ),
    );
  }
}