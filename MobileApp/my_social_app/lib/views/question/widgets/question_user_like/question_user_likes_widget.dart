import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/questions_state/question_user_like_state.dart';
import 'package:my_social_app/views/shared/app_column.dart';
import 'package:my_social_app/views/shared/user_item/user_item_widget.dart';
import 'package:my_social_app/views/user/pages/user_page/user_page.dart';

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
              .push(MaterialPageRoute(builder: (context) => UserPage(userId: e.userId))),
        )
      )
    );
  }
}