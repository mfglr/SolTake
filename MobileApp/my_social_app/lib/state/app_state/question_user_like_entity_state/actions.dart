import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/question_user_like_entity_state/question_user_like_state.dart';

@immutable
class NextQuestionLikesAction extends AppAction{
  final int questionId;
  const NextQuestionLikesAction({required this.questionId});
}
@immutable
class NextQuestionLikesSuccessAction extends AppAction{
  final int questionId;
  final Iterable<QuestionUserLikeState> questionUserLikes;
  const NextQuestionLikesSuccessAction({required this.questionId, required this.questionUserLikes});
}
@immutable
class NextQuestionLikesFailedAction extends AppAction{
  final int questionId;
  const NextQuestionLikesFailedAction({required this.questionId});
}