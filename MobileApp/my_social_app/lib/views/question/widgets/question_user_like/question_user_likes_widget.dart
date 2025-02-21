import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/question_user_like_entity_state/question_user_like_state.dart';
import 'package:my_social_app/views/question/widgets/question_user_like/question_user_like_widget.dart';

class QuestionUserLikesWidget extends StatelessWidget {
  final Iterable<QuestionUserLikeState> likes;
  const QuestionUserLikesWidget({
    super.key,
    required this.likes
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: 
        likes
        .mapIndexed(
          (index,like) => index != likes.length - 1 
            ? Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: QuestionUserLikeWidget(like: like),
              )
            : QuestionUserLikeWidget(like: like)
        )
        .toList(),
    );
  }
}