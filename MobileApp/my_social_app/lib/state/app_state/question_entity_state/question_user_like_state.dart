import 'package:flutter/material.dart';
import 'package:my_social_app/state/pagination/has_pagination_property.dart';

@immutable
class QuestionUserLikeState extends HasPaginationProperty<num>{
  final int userId;
  final DateTime createdAt;
  
  const QuestionUserLikeState({
    required super.key,
    required this.userId,
    required this.createdAt
  });
}