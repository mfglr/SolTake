import 'package:flutter/material.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/views/comment/pages/display_comment_likes_page/widgets/no_comment_user_likes_widget_constants.dart';

class NoCommentUserLikesWidget extends StatelessWidget {
  const NoCommentUserLikesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            noCommentUserLikes[getLanguage(context)]!,
            style: const TextStyle(
              fontSize: 25,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}