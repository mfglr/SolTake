import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/comment_user_like_state.dart';
import 'package:my_social_app/views/comment/widgets/comment_user_like_widget.dart';
import 'package:my_social_app/views/shared/app_columns.dart';

class CommentUserLikesWidget extends StatelessWidget {
  final Iterable<CommentUserLikeState> commentUserLikes;
  const CommentUserLikesWidget({
    super.key,
    required this.commentUserLikes
  });

  @override
  Widget build(BuildContext context) => 
    AppColumns(
      children: 
        commentUserLikes
          .map((commentUserLike) => CommentUserLikeWidget(commentUserLike: commentUserLike)),
    );
}