import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/question_user_like_state/question_user_like_state.dart';

@immutable
class AddQuestionUserLikesAction extends AppAction{
  final Iterable<QuestionUserLikeState> likes;
  const AddQuestionUserLikesAction({required this.likes});
}

@immutable
class AddQuestionUserLikeAction extends AppAction{
  final QuestionUserLikeState like;
  const AddQuestionUserLikeAction({required this.like});
}

@immutable
class RemoveQuestionUserLikeAction extends AppAction{
  final int likeId;
  const RemoveQuestionUserLikeAction({required this.likeId});
}