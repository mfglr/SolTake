import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_social_app/state/exams_state/exams_state.dart';
part 'exam.g.dart';

@immutable
@JsonSerializable()
class Exam{
  final int id;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final String shortName;
  final String fullName;

  const Exam({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.shortName,
    required this.fullName
  });

  factory Exam.fromJson(Map<String, dynamic> json) => _$ExamFromJson(json);
  Map<String, dynamic> toJson() => _$ExamToJson(this);
  
  ExamState toExamState()
    => ExamState(id: id,createdAt: createdAt,updatedAt: updatedAt,shortName: shortName,fullName: fullName);
}