import 'package:flutter/material.dart';

@immutable
class ExamState{
  final int id;
  final String shortName;
  final String fullName;

  const ExamState({
    required this.id,
    required this.shortName,
    required this.fullName,
  });
}

@immutable
class ExamEntityState{
  final List<ExamState> exams;
  final bool isLoaded;
  const ExamEntityState({required this.exams, required this.isLoaded});

  ExamEntityState loadExams(List<ExamState> exams)
    => ExamEntityState(exams: this.exams.followedBy(exams).toList(), isLoaded: true);
}

