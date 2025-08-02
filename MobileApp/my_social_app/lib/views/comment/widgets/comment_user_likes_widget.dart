import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/comment_user_like_state.dart';
import 'package:my_social_app/views/shared/app_column.dart';
import 'package:my_social_app/views/shared/user_item/user_item_widget.dart';
import 'package:my_social_app/views/user/pages/user_page/pages/user_page_by_id.dart';

class CommentUserLikesWidget extends StatelessWidget {
  final Iterable<CommentUserLikeState> commentUserLikes;
  const CommentUserLikesWidget({
    super.key,
    required this.commentUserLikes
  });

  @override
  Widget build(BuildContext context) => 
    AppColumn(
      children:
        commentUserLikes
          .map(
            (commentUserLike) => UserItemWidget(
              userItem: commentUserLike,
              onPressed: () =>
                Navigator
                  .of(context)
                  .push(MaterialPageRoute(builder: (context) => UserPageById(userId: commentUserLike.userId))),
            )
          ),
    );
}