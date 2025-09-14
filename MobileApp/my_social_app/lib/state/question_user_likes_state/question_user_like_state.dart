import 'package:flutter/material.dart';
import 'package:my_social_app/state/user_item.dart';

@immutable
class QuestionUserLikeState extends UserItem{
  QuestionUserLikeState({
    required super.id,
    required super.userId,
    required super.name,
    required super.userName,
    required super.image
  });
}