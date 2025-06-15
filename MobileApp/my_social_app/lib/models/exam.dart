import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/state/app_state/exam_entity_state/exam_state.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';
part 'exam.g.dart';

@JsonSerializable()
@immutable
class Exam{
  final int id;
  final String name;
  final String initialism;
  
  const Exam({
    required this.id,
    required this.name,
    required this.initialism,
  });

  factory Exam.fromJson(Map<String, dynamic> json) => _$ExamFromJson(json);
  Map<String, dynamic> toJson() => _$ExamToJson(this);
  
  ExamState toExamState()
    => ExamState(
        id: id,
        name: name,
        initialism: initialism,
        subjects: Pagination.init(subjectsPerPage,true),
        questions: Pagination.init(questionsPerPage,true)
      );
}