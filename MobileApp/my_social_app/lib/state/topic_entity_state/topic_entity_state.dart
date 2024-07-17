import 'package:flutter/material.dart';
import 'package:my_social_app/state/topic_entity_state/topic_state.dart';

@immutable
class TopicEntityState{
  final Map<int,bool> status;
  final Map<int,TopicState> topics;

  const TopicEntityState({required this.status, required this.topics});
  
  bool isLoaded(int? subjectId) => status[subjectId] ?? false;
  Iterable<TopicState> getTopics(int? subjectId) => topics.values.where((x) => x.subjectId == subjectId);

  Map<int,bool> _changeStatus(int subjectId){
    final Map<int,bool> status = {};
    status.addAll(this.status);
    status[subjectId] = true;
    return status;
  }
  Map<int,TopicState> _loadTopics(Iterable<TopicState> topics){
    final Map<int,TopicState> clone = {};
    final uniqTopics = topics.where((e) => this.topics[e.id] == null);
    clone.addAll(this.topics);
    clone.addEntries(uniqTopics.map((e) => MapEntry(e.id, e)));
    return clone;
  }
  Map<int,TopicState> _updateTopic(TopicState topic){
    final Map<int,TopicState> clone = {};
    clone.addAll(topics);
    clone[topic.id] = topic;
    return clone;
  }

  TopicEntityState loadBySubjcetId(int subjectId,List<TopicState> topics)
    => TopicEntityState(status: _changeStatus(subjectId),topics:_loadTopics(topics));
  
  TopicEntityState load(Iterable<TopicState> topics)
    => TopicEntityState(status: status,topics:_loadTopics(topics));

  TopicEntityState loadQuestions(int topicId,Iterable<int> questionIds)
    => TopicEntityState(status: status,topics: _updateTopic(topics[topicId]!.loadQuestionIds(questionIds)));
}