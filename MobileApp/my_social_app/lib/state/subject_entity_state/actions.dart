import 'package:flutter/material.dart';
import 'package:my_social_app/state/actions.dart' as redux;
import 'package:my_social_app/state/subject_entity_state/subject_entity_state.dart';

@immutable
class LoadSubjectsAction extends redux.Action{
  const LoadSubjectsAction();
}

@immutable
class LoadSubjectsSuccessAction extends redux.Action{
  final int examId;
  final List<SubjectState> payload;
  const LoadSubjectsSuccessAction({required this.examId,required this.payload});
}