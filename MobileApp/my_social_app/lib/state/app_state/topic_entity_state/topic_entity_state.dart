import 'package:flutter/material.dart';
import 'package:my_social_app/state/entity_state/entity_state.dart';
import 'package:my_social_app/state/app_state/topic_entity_state/topic_state.dart';

@immutable
class TopicEntityState extends EntityState<TopicState>{
  const TopicEntityState({required super.entities});
 
  TopicEntityState startLoadingNextQuestions(int topicId)
    => TopicEntityState(entities: updateOne(entities[topicId]?.startLoadingNextQuestions()));
  TopicEntityState addNextQuestions(int topicId,Iterable<int> questionIds)
    => TopicEntityState(entities: updateOne(entities[topicId]?.addNextQuestions(questionIds)));
  TopicEntityState stopLoadingNextQuestions(int topicId)
    => TopicEntityState(entities: updateOne(entities[topicId]?.stopLoadingNextQuestions()));

  TopicEntityState startLoadingPrevQuestions(int topicId)
    => TopicEntityState(entities: updateOne(entities[topicId]?.startLoadingPrevQuestions()));
  TopicEntityState addPrevPageQuestions(int topicId,Iterable<int> questionIds)
    => TopicEntityState(entities: updateOne(entities[topicId]?.addPrevQuestions(questionIds)));
  TopicEntityState stopLoadingPrevQuestions(int topicId)
    => TopicEntityState(entities: updateOne(entities[topicId]?.stopLoadingPrevQuestions()));

  TopicEntityState addTopic(TopicState topic)
    => TopicEntityState(entities: appendOne(topic));
  TopicEntityState addTopics(Iterable<TopicState> topics)
    => TopicEntityState(entities: appendMany(topics));
  TopicEntityState addLists(Iterable<Iterable<TopicState>> lists)
    => TopicEntityState(entities: appendLists(lists));
}