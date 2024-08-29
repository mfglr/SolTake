import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/comment_state.dart';
import 'package:my_social_app/views/comment/pages/display_comment_likes_page.dart';

class DisplayCommentLikesButton extends StatelessWidget {
  final CommentState comment;

  const DisplayCommentLikesButton({
    super.key,
    required this.comment
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => 
        Navigator
          .of(context)
          .push(MaterialPageRoute(builder:(context) => DisplayCommentLikesPage(commentId: comment.id))),
      style: ButtonStyle(
        padding: WidgetStateProperty.all(EdgeInsets.zero),
        minimumSize: WidgetStateProperty.all(const Size(0, 0)),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Text(
        comment.numberOfLikes.toString(),
        style: const TextStyle(
          fontSize: 11
        ),
      )
    );
  }
}