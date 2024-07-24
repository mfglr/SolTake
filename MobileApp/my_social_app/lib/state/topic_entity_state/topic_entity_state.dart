import 'package:flutter/material.dart';
import 'package:my_social_app/state/entity_state.dart';
import 'package:my_social_app/state/topic_entity_state/topic_state.dart';

@immutable
class TopicEntityState extends EntityState<TopicState>{
  const TopicEntityState({required super.entities});
 
  TopicEntityState addTopics(Iterable<TopicState> topics)
    => TopicEntityState(entities: appendMany(topics));
  TopicEntityState addLists(Iterable<Iterable<TopicState>> lists)
    => TopicEntityState(entities: appendLists(lists));
  TopicEntityState loadQuestions(int topicId,Iterable<int> questionIds)
    => TopicEntityState(entities: updateOne(entities[topicId]!.loadQuestionIds(questionIds)));
  
  Iterable<TopicState> getSubjectTopics(int? subjectId)
    => entities.values.where((e) => e.subjectId == subjectId);
}