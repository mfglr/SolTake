import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/comment_user_like_state.dart';
import 'package:my_social_app/views/shared/user_item/user_item_widget.dart';

class CommentUserLikeWidget extends StatelessWidget {
  final CommentUserLikeState commentUserLike;
  const CommentUserLikeWidget({
    super.key,
    required this.commentUserLike
  });

  @override
  Widget build(BuildContext context) => UserItemWidget(userItem: commentUserLike);
}