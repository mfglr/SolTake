import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:my_social_app/state/entity_state/entity_state.dart';
import 'package:my_social_app/state/app_state/question_user_like_state/question_user_like_state.dart';

@immutable
class QuestionUserLikeEntityState extends EntityState<QuestionUserLikeState>{
  const QuestionUserLikeEntityState({required super.containers});

  QuestionUserLikeEntityState addLikes(Iterable<QuestionUserLikeState> likes)
    => QuestionUserLikeEntityState(containers: appendMany(likes));
  QuestionUserLikeEntityState addLike(QuestionUserLikeState like)
    => QuestionUserLikeEntityState(containers: appendOne(like));
  QuestionUserLikeEntityState removeLike(int likeId)
    => QuestionUserLikeEntityState(containers: removeOne(likeId));

  QuestionUserLikeState? select(int likerId) 
    => containers.values.firstWhereOrNull((like) => like.entity.appUserId == likerId)?.entity; 
}