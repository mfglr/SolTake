import 'package:flutter/material.dart';
import 'package:my_social_app/state/entity_state/entity_state.dart';
import 'package:my_social_app/state/app_state/subject_entity_state/subject_state.dart';

@immutable
class SubjectEntityState extends EntityState<SubjectState>{
  const SubjectEntityState({required super.entities});
  
  SubjectEntityState getNextPageQuestions(int subjectId)
    => SubjectEntityState(entities: updateOne(entities[subjectId]!.getNextPageQuestions()));
  SubjectEntityState addNextPageQuestions(int subjectId, Iterable<int> quesionIds)
    => SubjectEntityState(entities: updateOne(entities[subjectId]!.addNextPageQuestions(quesionIds)));

  SubjectEntityState loadTopics(int subjectId,Iterable<int> topicIds)
    => SubjectEntityState(entities: updateOne(entities[subjectId]!.loadTopics(topicIds)));

  SubjectEntityState addSubject(SubjectState subject)
    => SubjectEntityState(entities: appendOne(subject));
  SubjectEntityState addSubjects(Iterable<SubjectState> subjects)
    => SubjectEntityState(entities: appendMany(subjects));

  SubjectEntityState getPrevPageQuestions(int subjectId)
    => SubjectEntityState(entities: updateOne(entities[subjectId]?.getPrevPageQuestions()));
  SubjectEntityState addPrevPageQuestions(int subjectId,Iterable<int> questionIds)
    => SubjectEntityState(entities: updateOne(entities[subjectId]?.addPrevPageQuestions(questionIds)));

  Iterable<SubjectState> getSubjectsByExamId(int? examId)
    => entities.values.where((x) => x.examId == examId);
}