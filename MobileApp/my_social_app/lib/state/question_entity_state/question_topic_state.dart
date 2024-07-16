import 'package:flutter/material.dart';

@immutable
class QuestionTopicState{
  final int id;
  final String name;
  const QuestionTopicState({
    required this.id,
    required this.name
  });
}
