import 'package:flutter/material.dart';
import 'package:my_social_app/state/entity_state.dart';
import 'package:my_social_app/state/exam_entity_state/exam_state.dart';

@immutable
class ExamEntityState extends EntityState<ExamState>{
  final bool isLoading;
  final bool isLast;
  const ExamEntityState({
    required super.entities,
    required this.isLoading,
    required this.isLast
  });

  ExamEntityState getNextPageQuestions(int examId)
    => ExamEntityState(
      entities: updateOne(entities[examId]!.getNextPageQuestions()),
      isLoading: isLoading,
      isLast: isLast
    );
  ExamEntityState addNextPageQuestions(int examId, Iterable<int> questionIds)
    => ExamEntityState(
        entities: updateOne(entities[examId]!.addNextPageQuestions(questionIds)),
        isLoading: isLoading,
        isLast: isLast
      );

  ExamEntityState getAllExams()
    => ExamEntityState(
        entities: entities,
        isLoading: true,
        isLast: isLast
      );
  ExamEntityState addAllExams(Iterable<ExamState> exams)
    => ExamEntityState(
        entities: appendMany(exams),
        isLoading: false,
        isLast: true,
      );
  ExamEntityState addExam(ExamState exam)
    => ExamEntityState(
        entities: appendOne(exam),
        isLoading: isLoading,
        isLast: isLast
      );
  ExamEntityState addExams(Iterable<ExamState> exams)
    => ExamEntityState(
        entities: appendMany(exams),
        isLoading: isLoading,
        isLast: isLast,
      );

  ExamEntityState loadExamSubjects(int examId,Iterable<int> ids)
    => ExamEntityState(
        entities: updateOne(entities[examId]!.addNextPageSubjects(ids)),
        isLoading: isLoading,
        isLast: isLast,
      );

  Iterable<ExamState> get exams => entities.values;
}

