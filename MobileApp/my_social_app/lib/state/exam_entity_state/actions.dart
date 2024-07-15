import 'package:flutter/material.dart';
import 'package:my_social_app/state/actions.dart' as redux;
import 'package:my_social_app/state/exam_entity_state/exam_entity_state.dart';

@immutable
class LoadExamsAction extends redux.Action{
  const LoadExamsAction();
}

@immutable
class LoadExamSuccessAction extends redux.Action{
  final List<ExamState> payload;
  const LoadExamSuccessAction({required this.payload});
}