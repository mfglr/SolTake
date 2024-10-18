import 'package:flutter/material.dart';
import 'package:my_social_app/state/entity_state/entity_state.dart';
import 'package:my_social_app/state/app_state/subject_entity_state/subject_state.dart';

@immutable
class SubjectEntityState extends EntityState<SubjectState>{
  const SubjectEntityState({required super.entities});
  
  SubjectEntityState startLoadingNextQuestions(int subjectId)
    => SubjectEntityState(entities: updateOne(entities[subjectId]?.startLoadingNextQuestions()));
  SubjectEntityState addNextPageQuestions(int subjectId, Iterable<int> quesionIds)
    => SubjectEntityState(entities: updateOne(entities[subjectId]?.addNextPageQuestions(quesionIds)));
  SubjectEntityState stopLoadingNextQuestions(int subjectId)
    => SubjectEntityState(entities: updateOne(entities[subjectId]?.stopLoadingNextQuestions()));

  SubjectEntityState startLoadingNextTopics(int subjectId)
    => SubjectEntityState(entities: updateOne(entities[subjectId]?.startloadingNextTopics()));
  SubjectEntityState addNextPageTopics(int subjectId,Iterable<int> topicIds)
    => SubjectEntityState(entities: updateOne(entities[subjectId]?.addNextTopics(topicIds)));
  SubjectEntityState stopLoadingNextTopics(int subjectId)
    => SubjectEntityState(entities: updateOne(entities[subjectId]?.stopLoadingNextTopics()));

  SubjectEntityState addSubject(SubjectState subject)
    => SubjectEntityState(entities: appendOne(subject));
  SubjectEntityState addSubjects(Iterable<SubjectState> subjects)
    => SubjectEntityState(entities: appendMany(subjects));

  SubjectEntityState startLoadingPrevQuestions(int subjectId)
    => SubjectEntityState(entities: updateOne(entities[subjectId]?.startLoadingPrevQuestions()));
  SubjectEntityState addPrevPageQuestions(int subjectId,Iterable<int> questionIds)
    => SubjectEntityState(entities: updateOne(entities[subjectId]?.addPrevQuestions(questionIds)));
  SubjectEntityState stopLoadingPrevQuestions(int subjectId)
    => SubjectEntityState(entities: updateOne(entities[subjectId]?.stopLoadingPrevQuestions()));
}