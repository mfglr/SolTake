import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:test_app/models/exam_state.dart';
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
      );
}