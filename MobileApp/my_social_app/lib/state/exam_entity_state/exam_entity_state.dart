import 'package:flutter/material.dart';
import 'package:my_social_app/state/entity_state.dart/entity_state.dart';
import 'package:my_social_app/state/exam_entity_state/exam_state.dart';

@immutable
class ExamEntityState extends EntityState<ExamState>{
  final bool isLoaded;
  const ExamEntityState({required super.entities,required this.isLoaded});

  Map<int,ExamState> _nextPageOfQuestions(int examId, Iterable<int> questionIds)
    => updateOne(entities[examId]!.nextPageOfQuestions(questionIds));

  Map<int,ExamState> _loadSubjects(int examId, Iterable<int> ids)
    => updateOne(entities[examId]!.loadSubjects(ids));

  ExamEntityState addAllExams(Iterable<ExamState> exams)
    => ExamEntityState(entities: addManyEnd(exams), isLoaded: true);

  ExamEntityState addExams(Iterable<ExamState> exams)
    => ExamEntityState(entities: addManyEnd(exams), isLoaded: isLoaded);

  ExamEntityState nextPageOfQuestions(int examId, Iterable<int> questionIds)
    => ExamEntityState(entities: _nextPageOfQuestions(examId,questionIds), isLoaded: isLoaded);

  ExamEntityState loadExamSubjects(int examId,Iterable<int> ids)
    => ExamEntityState(entities: _loadSubjects(examId,ids),isLoaded: isLoaded);

  Iterable<ExamState> get exams => entities.values;
}

