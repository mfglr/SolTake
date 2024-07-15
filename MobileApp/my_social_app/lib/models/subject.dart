import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_social_app/state/subject_entity_state/subject_entity_state.dart';
part 'subject.g.dart';

@immutable
@JsonSerializable()
class Subject{
  final int id;
  final int examId;
  final String name;
  
  const Subject({required this.id,required this.examId,required this.name});

  factory Subject.fromJson(Map<String, dynamic> json) => _$SubjectFromJson(json);
  Map<String, dynamic> toJson() => _$SubjectToJson(this);

  SubjectState toSubjectState() => SubjectState(id: id, examId: examId, name: name);
}