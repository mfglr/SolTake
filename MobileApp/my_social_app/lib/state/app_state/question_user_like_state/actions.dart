import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart' as redux;
import 'package:my_social_app/state/app_state/question_user_like_state/question_user_like_state.dart';

@immutable
class AddQuestionUserLikesAction extends redux.Action{
  final Iterable<QuestionUserLikeState> likes;
  const AddQuestionUserLikesAction({required this.likes});
}

@immutable
class AddQuestionUserLikeAction extends redux.Action{
  final QuestionUserLikeState like;
  const AddQuestionUserLikeAction({required this.like});
}

@immutable
class RemoveQuestionUserLikeAction extends redux.Action{
  final int likeId;
  const RemoveQuestionUserLikeAction({required this.likeId});
}