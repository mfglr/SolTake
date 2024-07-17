import 'package:flutter/material.dart';
import 'package:my_social_app/state/exam_entity_state/exam_state.dart';


@immutable
class ExamEntityState{
  final Map<int,ExamState> exams;
  final bool isLoaded;
  const ExamEntityState({required this.exams, required this.isLoaded});

  Map<int,ExamState> _loadExams(Iterable<ExamState> exams){
    final Map<int,ExamState> clone = {};
    final uniqExams = exams.where((e) => this.exams[e.id] == null);
    clone.addAll(this.exams);
    clone.addEntries(uniqExams.map((e)=> MapEntry(e.id, e)));
    return clone;
  }
  Map<int,ExamState> _nextPageOfQuestions(int examId, Iterable<int> questionIds){
    final Map<int,ExamState> clone = {};
    clone.addAll(exams);
    clone[examId] = clone[examId]!.nextPageOfQuestions(questionIds);
    return clone;
  }

  ExamEntityState loadExams(Iterable<ExamState> exams)
    => ExamEntityState(exams: _loadExams(exams), isLoaded: true);

  ExamEntityState nextPageOfQuestions(int examId, Iterable<int> questionIds)
    => ExamEntityState(exams: _nextPageOfQuestions(examId,questionIds), isLoaded: isLoaded);


  List<ExamState> get examValues => exams.values.toList();
}

