import 'package:flutter/material.dart';
import 'package:my_social_app/state/comments_state/comment_state.dart';
import 'package:my_social_app/views/comment/pages/display_comment_likes_page/display_comment_likes_page.dart';
import 'package:my_social_app/views/shared/language_widget.dart';
import 'display_comment_likes_button_texts.dart' show content;

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
      child: LanguageWidget(
        child: (language) => Text(
          "${comment.numberOfLikes.toString()} ${content[language]}",
          style: const TextStyle(
            fontSize: 11,
            decoration: TextDecoration.underline
          ),
        ),
      )
    );
  }
}