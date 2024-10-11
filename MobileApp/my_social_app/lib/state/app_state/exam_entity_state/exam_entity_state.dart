import 'package:flutter/material.dart';
import 'package:my_social_app/state/entity_state/entity_state.dart';
import 'package:my_social_app/state/app_state/exam_entity_state/exam_state.dart';

@immutable
class ExamEntityState extends EntityState<ExamState>{
  
  const ExamEntityState({required super.entities});

  ExamEntityState startLoadingNextQuestions(int examId)
    => ExamEntityState(entities: updateOne(entities[examId]?.startLoadingNextQuestions()));
  ExamEntityState stopLoadingNextQuestions(int examId)
    => ExamEntityState(entities: updateOne(entities[examId]?.stopLoadingNextQuestions()));
  ExamEntityState addNextQuestions(int examId, Iterable<int> questionIds)
    => ExamEntityState(entities: updateOne(entities[examId]?.addNextQuestions(questionIds)));

  ExamEntityState startLoadingPrevQuestions(int examId)
    => ExamEntityState(entities: updateOne(entities[examId]?.startLoadingPrevQuestions()));
  ExamEntityState stopLoadingPrevQuestions(int examId)
    => ExamEntityState(entities: updateOne(entities[examId]?.stopLoadingPrevQuestions()));
  ExamEntityState addPrevPageQuestions(int examId,Iterable<int> questionIds)
    => ExamEntityState(entities: updateOne(entities[examId]?.addPrevQuestions(questionIds)));

  ExamEntityState getAllExams()
    => ExamEntityState(entities: entities);
  ExamEntityState addAllExams(Iterable<ExamState> exams)
    => ExamEntityState(entities: appendMany(exams));
  ExamEntityState addExam(ExamState exam)
    => ExamEntityState(entities: appendOne(exam));
  ExamEntityState addExams(Iterable<ExamState> exams)
    => ExamEntityState(entities: appendMany(exams));

  ExamEntityState startLoadingNextSubjects(int examId)
    => ExamEntityState(entities: updateOne(entities[examId]?.startLoadingNextSubjects()));
  ExamEntityState stopLoadingNextSubjects(int examId)
    => ExamEntityState(entities: updateOne(entities[examId]?.stopLoadingNextSubjects()));
  ExamEntityState addNextSubjects(int examId,Iterable<int> ids)
    => ExamEntityState(entities: updateOne(entities[examId]?.addNextSubjects(ids)));
}

