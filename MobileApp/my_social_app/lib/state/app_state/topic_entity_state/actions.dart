import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/topic_entity_state/topic_state.dart';


@immutable
class AddTopicAction extends AppAction{
  final TopicState topic;
  const AddTopicAction({required this.topic});
}
@immutable
class AddTopicsAction extends AppAction{
  final Iterable<TopicState> topics;
  const AddTopicsAction({required this.topics});
}
@immutable
class AddTopicsListAction extends AppAction{
  final Iterable<Iterable<TopicState>> lists;
  const AddTopicsListAction({required this.lists});
}

@immutable
class NextTopicQuestionsAction extends AppAction{
  final num topicId;
  const NextTopicQuestionsAction({required this.topicId});
}
@immutable
class NextTopicQuestionsSuccessAction extends AppAction{
  final num topicId;
  final List<num> questionIds;
  const NextTopicQuestionsSuccessAction({required this.topicId, required this.questionIds});
}
@immutable
class NextTopicQuestionFailedAction extends AppAction{
  final num topicId;
  const NextTopicQuestionFailedAction({required this.topicId});
}

@immutable
class PrevTopicQuestionsAction extends AppAction{
  final num topicId;
  const PrevTopicQuestionsAction({required this.topicId});
}
@immutable
class PrevTopicQuestionsSuccessAction extends AppAction{
  final num topicId;
  final Iterable<num> questionIds;
  const PrevTopicQuestionsSuccessAction({required this.topicId, required this.questionIds});
}
@immutable
class PrevTopicQuestionsFailedAction extends AppAction{
  final num topicId;
  const PrevTopicQuestionsFailedAction({required this.topicId});
}