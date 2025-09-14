import 'package:flutter/material.dart';
import 'package:my_social_app/state/actions.dart';
import 'package:my_social_app/state/question_user_likes_state/question_user_like_state.dart';
import 'package:my_social_app/state/questions_state/question_state.dart';


@immutable
class NextQuestionUserLikesAction extends AppAction{
  final int questionId;
  const NextQuestionUserLikesAction({required this.questionId});
}
@immutable
class NextQuestionUserLikesSuccessAction extends AppAction{
  final int questionId;
  final Iterable<QuestionUserLikeState> questionUserLikes;
  const NextQuestionUserLikesSuccessAction({required this.questionId, required this.questionUserLikes});
}
@immutable
class NextQuestionUserLikesFailedAction extends AppAction{
  final int questionId;
  const NextQuestionUserLikesFailedAction({required this.questionId});
}

@immutable
class RefreshQuestionUserLikesAction extends AppAction{
  final int questionId;
  const RefreshQuestionUserLikesAction({required this.questionId});
}
@immutable
class RefreshQuestionUserLikesSuccessAction extends AppAction{
  final int questionId;
  final Iterable<QuestionUserLikeState> questionUserLikes;
  const RefreshQuestionUserLikesSuccessAction({required this.questionId, required this.questionUserLikes});
}
@immutable
class RefreshQuestionUserLikesFailedAction extends AppAction{
  final int questionId;
  const RefreshQuestionUserLikesFailedAction({required this.questionId});
}

@immutable
class LikeQuestionAction extends AppAction{
  final QuestionState question;
  const LikeQuestionAction({required this.question});
}
@immutable
class LikeQuestionSuccessAction extends AppAction{
  final QuestionState question;
  final QuestionUserLikeState questionUserLike;
  const LikeQuestionSuccessAction({required this.question, required this.questionUserLike});
}

@immutable
class DislikeQuestionAction extends AppAction{
  final QuestionState question;
  const DislikeQuestionAction({required this.question});
}
@immutable
class DislikeQuestionSuccessAction extends AppAction{
  final QuestionState question;
  final int userId;
  const DislikeQuestionSuccessAction({required this.question, required this.userId});
}
