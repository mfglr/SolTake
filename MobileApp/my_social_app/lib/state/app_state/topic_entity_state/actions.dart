import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart' as redux;
import 'package:my_social_app/state/app_state/topic_entity_state/topic_state.dart';


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
class GetNextPageTopicQuestionsIfReadyAction extends redux.Action{
  final int topicId;
  const GetNextPageTopicQuestionsIfReadyAction({required this.topicId});
}
@immutable
class GetNextPageTopicQuestionsIfNoPageAction extends redux.Action{
  final int topicId;
  const GetNextPageTopicQuestionsIfNoPageAction({required this.topicId});
}
@immutable
class GetNextPageTopicQuestionsAction extends redux.Action{
  final int topicId;
  const GetNextPageTopicQuestionsAction({required this.topicId});
}
@immutable
class AddNextPageTopicQuestionsAction extends redux.Action{
  final int topicId;
  final List<int> questionIds;
  const AddNextPageTopicQuestionsAction({required this.topicId, required this.questionIds});
}

@immutable
class GetPrevPageTopicQuestionsIfReadyAction extends redux.Action{
  final int topicId;
  const GetPrevPageTopicQuestionsIfReadyAction({required this.topicId});
}
@immutable
class GetPrevPageTopicQuestionsAction extends redux.Action{
  final int topicId;
  const GetPrevPageTopicQuestionsAction({required this.topicId});
}
@immutable
class AddPrevPageTopicQuestionsAction extends redux.Action{
  final int topicId;
  final Iterable<int> questionIds;
  const AddPrevPageTopicQuestionsAction({required this.topicId, required this.questionIds});
}