import 'package:flutter/material.dart';
import 'package:my_social_app/state/exam_entity_state/exam_state.dart';

@immutable
class ExamEntityState{
  final Map<int,ExamState> exams;
  final bool isLoaded;
  const ExamEntityState({required this.exams, required this.isLoaded});

  Map<int,ExamState> _addExams(Iterable<ExamState> values){
    final Map<int,ExamState> clone = {};
    final notAvaiables = values.where((e) => exams[e.id] == null);
    clone.addAll(exams);
    clone.addEntries(notAvaiables.map((e) => MapEntry(e.id, e)));
    return clone;
  }
  Map<int,ExamState> _nextPageOfQuestions(int examId, Iterable<int> questionIds){
    final Map<int,ExamState> clone = {};
    clone.addAll(exams);
    clone[examId] = clone[examId]!.nextPageOfQuestions(questionIds);
    return clone;
  }
  Map<int,ExamState> _loadSubjects(int examId, Iterable<int> ids){
    final Map<int,ExamState> clone = {};
    clone.addAll(exams);
    clone[examId] = exams[examId]!.loadExamSubjects(ids);
    return clone;
  }

  ExamEntityState addAllExams(Iterable<ExamState> exams)
    => ExamEntityState(exams: _addExams(exams), isLoaded: true);
  ExamEntityState addExams(Iterable<ExamState> exams)
    => ExamEntityState(exams: _addExams(exams), isLoaded: isLoaded);
  ExamEntityState nextPageOfQuestions(int examId, Iterable<int> questionIds)
    => ExamEntityState(exams: _nextPageOfQuestions(examId,questionIds), isLoaded: isLoaded);
  ExamEntityState loadExamSubjects(int examId,Iterable<int> ids)
    => ExamEntityState(exams: _loadSubjects(examId,ids),isLoaded: isLoaded);

  Iterable<ExamState> get examValues => exams.values;
}

