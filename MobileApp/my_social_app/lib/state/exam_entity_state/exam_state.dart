import 'package:flutter/material.dart';
import 'package:my_social_app/state/ids.dart';

@immutable
class ExamState{
  final int id;
  final String shortName;
  final String fullName;
  final Ids questions;

  const ExamState({
    required this.id,
    required this.shortName,
    required this.fullName,
    required this.questions
  });

  ExamState nextPageOfQuestions(Iterable<int> questionIds)
    => ExamState(
        id: id,
        shortName: shortName,
        fullName: fullName,
        questions: questions.nextPage(questionIds)
      );



}
