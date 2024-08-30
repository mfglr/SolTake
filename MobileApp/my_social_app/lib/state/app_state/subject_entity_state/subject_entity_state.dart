import 'package:flutter/material.dart';
import 'package:my_social_app/state/entity_state/entity_state.dart';
import 'package:my_social_app/state/app_state/subject_entity_state/subject_state.dart';

@immutable
class SubjectEntityState extends EntityState<SubjectState>{
  const SubjectEntityState({required super.containers});
  
  SubjectEntityState getNextPageQuestions(int subjectId)
    => SubjectEntityState(containers: updateOne(containers[subjectId]!.entity.getNextPageQuestions()));
  SubjectEntityState addNextPageQuestions(int subjectId, Iterable<int> quesionIds)
    => SubjectEntityState(containers: updateOne(containers[subjectId]!.entity.addNextPageQuestions(quesionIds)));

  SubjectEntityState loadTopics(int subjectId,Iterable<int> topicIds)
    => SubjectEntityState(containers: updateOne(containers[subjectId]!.entity.loadTopics(topicIds)));

  SubjectEntityState addSubject(SubjectState subject)
    => SubjectEntityState(containers: appendOne(subject));
  SubjectEntityState addSubjects(Iterable<SubjectState> subjects)
    => SubjectEntityState(containers: appendMany(subjects));

  

  Iterable<SubjectState> getSubjectsByExamId(int? examId)
    => containers.values.where((x) => x.entity.examId == examId).map((e) => e.entity);
}