import 'package:flutter/material.dart';
import 'package:my_social_app/state/question_user_likes_state/question_user_like_state.dart';
import 'package:my_social_app/views/shared/app_column.dart';
import 'package:my_social_app/views/shared/user_item/user_item_widget.dart';
import 'package:my_social_app/views/user/pages/user_page/pages/user_page_by_id.dart';

class QuestionUserLikesWidget extends StatelessWidget {
  final Iterable<QuestionUserLikeState> likes;
  const QuestionUserLikesWidget({
    super.key,
    required this.likes
  });

  @override
  Widget build(BuildContext context) {
    return AppColumn(
      children: likes
        .map((e) => UserItemWidget(
          userItem: e,
          onPressed: () =>
            Navigator
              .of(context)
              .push(MaterialPageRoute(builder: (context) => UserPageById(userId: e.userId))),
        )
      )
    );
  }
}