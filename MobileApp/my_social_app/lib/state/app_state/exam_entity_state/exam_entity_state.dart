import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/entity_state.dart';
import 'package:my_social_app/state/app_state/exam_entity_state/exam_state.dart';

@immutable
class ExamEntityState extends EntityState<ExamState>{
  
  const ExamEntityState({required super.entities});

  ExamEntityState getNextPageQuestions(int examId)
    => ExamEntityState(entities: updateOne(entities[examId]?.getNextPageQuestions()));
  ExamEntityState addNextPageQuestions(int examId, Iterable<int> questionIds)
    => ExamEntityState(entities: updateOne(entities[examId]?.addNextPageQuestions(questionIds)));

  ExamEntityState getPrevPageQuestions(int examId)
    => ExamEntityState(entities: updateOne(entities[examId]?.getPrevPageQuestions()));
  ExamEntityState addPrevPageQuestions(int examId,Iterable<int> questionIds)
    => ExamEntityState(entities: updateOne(entities[examId]?.addPrevPageQuestions(questionIds)));

  ExamEntityState getAllExams()
    => ExamEntityState(entities: entities);
  ExamEntityState addAllExams(Iterable<ExamState> exams)
    => ExamEntityState(entities: appendMany(exams));
  ExamEntityState addExam(ExamState exam)
    => ExamEntityState(entities: appendOne(exam));
  ExamEntityState addExams(Iterable<ExamState> exams)
    => ExamEntityState(entities: appendMany(exams));

  ExamEntityState loadExamSubjects(int examId,Iterable<int> ids)
    => ExamEntityState(entities: updateOne(entities[examId]!.addNextPageSubjects(ids)));
}

