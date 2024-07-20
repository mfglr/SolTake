import 'package:flutter/material.dart';
import 'package:my_social_app/state/entity_state.dart/entity_state.dart';
import 'package:my_social_app/state/subject_entity_state/subject_state.dart';

@immutable
class SubjectEntityState extends EntityState<SubjectState>{
  const SubjectEntityState({required super.entities});
  
  SubjectEntityState loadTopics(int subjectId,Iterable<int> topicIds)
    => SubjectEntityState(entities: updateOne(entities[subjectId]!.loadTopics(topicIds)));

  SubjectEntityState addSubjects(Iterable<SubjectState> subjects)
    => SubjectEntityState(entities: addManyEnd(subjects));

  SubjectEntityState nextPageOfQuestions(int subjectId, Iterable<int> quesionIds)
    => SubjectEntityState(entities: updateOne(entities[subjectId]!.nextPageOfQuestions(quesionIds)));

  Iterable<SubjectState> getSubjectsByExamId(int? examId)
    => entities.values.where((x) => x.examId == examId);
}