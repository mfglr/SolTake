import 'package:flutter/material.dart';
import 'package:my_social_app/state/entity_state/entity_state.dart';
import 'package:my_social_app/state/app_state/topic_entity_state/topic_state.dart';

@immutable
class TopicEntityState extends EntityState<TopicState>{
  const TopicEntityState({required super.entities});
 
  TopicEntityState getNextPageQuestions(int topicId)
    => TopicEntityState(entities: updateOne(entities[topicId]!.getNextPageQuestions()));
  TopicEntityState addNextPageQuestions(int topicId,Iterable<int> questionIds)
    => TopicEntityState(entities: updateOne(entities[topicId]!.addNextPageQuestions(questionIds)));

  TopicEntityState getPrevPageQuestions(int topicId)
    => TopicEntityState(entities: updateOne(entities[topicId]?.getPrevPageQuestions()));
  TopicEntityState addPrevPageQuestions(int topicId,Iterable<int> questionIds)
    => TopicEntityState(entities: updateOne(entities[topicId]?.addPrevPageQuestions(questionIds)));

  TopicEntityState addTopics(Iterable<TopicState> topics)
    => TopicEntityState(entities: appendMany(topics));
  TopicEntityState addLists(Iterable<Iterable<TopicState>> lists)
    => TopicEntityState(entities: appendLists(lists));
}