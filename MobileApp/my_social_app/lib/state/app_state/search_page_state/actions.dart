import 'package:flutter/foundation.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/exams_state/exam_state.dart';
import 'package:my_social_app/state/app_state/subjects_state/subject_state.dart';
import 'package:my_social_app/state/app_state/topic_entity_state/topic_state.dart';

@immutable
class ChangeExamAction extends AppAction{
  final ExamState? exam;
  const ChangeExamAction({required this.exam});
}

@immutable
class ChangeSubjectAction extends AppAction{
  final SubjectState? subject;
  const ChangeSubjectAction({required this.subject});
}

@immutable
class ChangeTopicAction extends AppAction{
  final TopicState? topic;
  const ChangeTopicAction({required this.topic});
}