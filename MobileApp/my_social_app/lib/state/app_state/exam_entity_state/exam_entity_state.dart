import 'package:flutter/material.dart';
import 'package:my_social_app/state/entity_state/entity_state.dart';
import 'package:my_social_app/state/app_state/exam_entity_state/exam_state.dart';

@immutable
class ExamEntityState extends EntityState<ExamState>{
  final bool isLoading;
  final bool isLast;
  const ExamEntityState({
    required super.containers,
    required this.isLoading,
    required this.isLast
  });

  ExamEntityState getNextPageQuestions(int examId)
    => ExamEntityState(
      containers: updateOne(containers[examId]?.entity.getNextPageQuestions()),
      isLoading: isLoading,
      isLast: isLast
    );
  ExamEntityState addNextPageQuestions(int examId, Iterable<int> questionIds)
    => ExamEntityState(
        containers: updateOne(containers[examId]?.entity.addNextPageQuestions(questionIds)),
        isLoading: isLoading,
        isLast: isLast
      );

  ExamEntityState getAllExams()
    => ExamEntityState(
        containers: containers,
        isLoading: true,
        isLast: isLast
      );
  ExamEntityState addAllExams(Iterable<ExamState> exams)
    => ExamEntityState(
        containers: appendMany(exams),
        isLoading: false,
        isLast: true,
      );
  ExamEntityState addExam(ExamState exam)
    => ExamEntityState(
        containers: appendOne(exam),
        isLoading: isLoading,
        isLast: isLast
      );
  ExamEntityState addExams(Iterable<ExamState> exams)
    => ExamEntityState(
        containers: appendMany(exams),
        isLoading: isLoading,
        isLast: isLast,
      );

  ExamEntityState loadExamSubjects(int examId,Iterable<int> ids)
    => ExamEntityState(
        containers: updateOne(containers[examId]?.entity.addNextPageSubjects(ids)),
        isLoading: isLoading,
        isLast: isLast,
      );

  Iterable<ExamState> get exams => containers.values.map((e) => e.entity);
}

