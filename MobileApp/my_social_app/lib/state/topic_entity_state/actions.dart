import 'package:flutter/material.dart';
import 'package:my_social_app/state/actions.dart' as redux;
import 'package:my_social_app/state/topic_entity_state/topic_state.dart';

@immutable
class LoadTopicsBySubjectIdAction extends redux.Action{
  const LoadTopicsBySubjectIdAction();
}
@immutable
class LoadTopicsBySubjectIdSuccessAction extends redux.Action{
  final int subjectId;
  final List<TopicState> topics;
  const LoadTopicsBySubjectIdSuccessAction({required this.subjectId,required this.topics});
}

@immutable
class LoadTopicsSuccessAction extends redux.Action{
  final Iterable<TopicState> topics;
  const LoadTopicsSuccessAction({required this.topics});
}

@immutable
class NextPageOfTopicQuestionsAction extends redux.Action{
  final int topicId;
  const NextPageOfTopicQuestionsAction({required this.topicId});
}
@immutable
class NextPageOfTopicQuestionsSuccessAction extends redux.Action{
  final int topicId;
  final List<int> questionIds;
  const NextPageOfTopicQuestionsSuccessAction({required this.topicId, required this.questionIds});
}