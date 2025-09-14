import 'package:flutter/material.dart';
import 'package:my_social_app/state/actions.dart';
import 'package:my_social_app/state/topics_state/topic_state.dart';

@immutable
class NextSubjectTopicsAction extends AppAction{
  final int subjectId;
  const NextSubjectTopicsAction({required this.subjectId});
}
@immutable
class NextSubjectTopicsSuccessAction extends AppAction{
  final int subjectId;
  final Iterable<TopicState> topics;
  const NextSubjectTopicsSuccessAction({required this.subjectId, required this.topics});
}
@immutable
class NextSubjectTopicFailedAction extends AppAction{
  final int subjectId;
  const NextSubjectTopicFailedAction({required this.subjectId});
}

@immutable
class RefreshSubjectTopicsAction extends AppAction{
  final int subjectId;
  const RefreshSubjectTopicsAction({required this.subjectId});
}
@immutable
class RefreshSubjectTopicsSuccessAction extends AppAction{
  final int subjectId;
  final Iterable<TopicState> topics;
  const RefreshSubjectTopicsSuccessAction({required this.subjectId, required this.topics});
}
@immutable
class RefreshSubjectTopicFailedAction extends AppAction{
  final int subjectId;
  const RefreshSubjectTopicFailedAction({required this.subjectId});
}