import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:my_social_app/state/entity_state/entity_state.dart';
import 'package:my_social_app/state/app_state/question_user_like_state/question_user_like_state.dart';

@immutable
class QuestionUserLikeEntityState extends EntityState<QuestionUserLikeState>{
  const QuestionUserLikeEntityState({required super.entities});

  QuestionUserLikeEntityState addLikes(Iterable<QuestionUserLikeState> likes)
    => QuestionUserLikeEntityState(entities: appendMany(likes));
  QuestionUserLikeEntityState addLike(QuestionUserLikeState like)
    => QuestionUserLikeEntityState(entities: appendOne(like));
  QuestionUserLikeEntityState removeLike(int likeId)
    => QuestionUserLikeEntityState(entities: removeOne(likeId));

  QuestionUserLikeState? select(int questionId, int likerId) 
    => entities.values.firstWhereOrNull((like) => like.questionId == questionId && like.appUserId == likerId); 
}