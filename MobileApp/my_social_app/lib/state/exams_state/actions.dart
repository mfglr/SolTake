import 'package:flutter/material.dart';
import 'package:my_social_app/state/actions.dart' as redux;
import 'package:my_social_app/state/exams_state/exams_state.dart';

@immutable
class LoadExamsAction extends redux.Action{
  const LoadExamsAction();
}

@immutable
class LoadExamSuccessAction extends redux.Action{
  final List<ExamState> payload;
  const LoadExamSuccessAction({required this.payload});
}