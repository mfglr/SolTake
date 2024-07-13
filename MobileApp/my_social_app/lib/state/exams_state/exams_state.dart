import 'package:flutter/material.dart';

@immutable
class ExamState{
  final int id;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final String shortName;
  final String fullName;

  const ExamState({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.shortName,
    required this.fullName,
  });
}

@immutable
class ExamsState{
  final List<ExamState> exams;
  final bool isLoaded;
  const ExamsState({required this.exams, required this.isLoaded});

  ExamsState loadExams(List<ExamState> exams)
    => ExamsState(exams: this.exams.followedBy(exams).toList(), isLoaded: true);
}

