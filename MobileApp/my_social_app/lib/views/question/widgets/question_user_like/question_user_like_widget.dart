import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_user_like_state.dart';
import 'package:my_social_app/views/shared/user_item/user_item_widget.dart';

class QuestionUserLikeWidget extends StatelessWidget {
  final QuestionUserLikeState like;
  const QuestionUserLikeWidget({
    super.key,
    required this.like
  });

  @override
  Widget build(BuildContext context) {
    return UserItemWidget(userItem: like);
  }
}