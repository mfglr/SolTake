import 'package:flutter/material.dart';
import 'package:my_social_app/state/entity_state/entity_state.dart';
import 'package:my_social_app/state/app_state/topic_entity_state/topic_state.dart';

@immutable
class TopicEntityState extends EntityState<TopicState>{
  const TopicEntityState({required super.entities});
 
  TopicEntityState getNextPageQuestions(int topicId)
    => TopicEntityState(entities: updateOne(entities[topicId]!.entity.getNextPageQuestions()));
  TopicEntityState addNextPageQuestions(int topicId,Iterable<int> questionIds)
    => TopicEntityState(entities: updateOne(entities[topicId]!.entity.addNextPageQuestions(questionIds)));

  TopicEntityState addTopics(Iterable<TopicState> topics)
    => TopicEntityState(entities: appendMany(topics));
  TopicEntityState addLists(Iterable<Iterable<TopicState>> lists)
    => TopicEntityState(entities: appendLists(lists));

  
  Iterable<TopicState> getSubjectTopics(int? subjectId)
    => entities.values.where((e) => e.entity.subjectId == subjectId).map((e) => e.entity);
}