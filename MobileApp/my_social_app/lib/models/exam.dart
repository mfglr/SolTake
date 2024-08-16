import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/state/app_state/exam_entity_state/exam_state.dart';
import 'package:my_social_app/state/app_state/pagination.dart';
part 'exam.g.dart';

@immutable
@JsonSerializable()
class Exam{
  final int id;
  final String shortName;
  final String fullName;
  
  const Exam({
    required this.id,
    required this.shortName,
    required this.fullName,
  });

  factory Exam.fromJson(Map<String, dynamic> json) => _$ExamFromJson(json);
  Map<String, dynamic> toJson() => _$ExamToJson(this);
  
  ExamState toExamState()
    => ExamState(
        id: id,
        shortName: shortName,
        fullName: fullName,
        subjects: Pagination.init(subjectsPerPage),
        questions: Pagination.init(questionsPerPage)
      );
}