import 'package:flutter/material.dart';
import 'package:my_social_app/state/actions.dart' as redux;
import 'package:my_social_app/state/topic_entity_state/topic_state.dart';


@immutable
class AddTopicsAction extends redux.Action{
  final Iterable<TopicState> topics;
  const AddTopicsAction({required this.topics});
}
@immutable
class AddTopicsListAction extends redux.Action{
  final Iterable<Iterable<TopicState>> lists;
  const AddTopicsListAction({required this.lists});
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