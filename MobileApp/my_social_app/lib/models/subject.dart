import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';
import 'package:my_social_app/state/app_state/subject_entity_state/subject_state.dart';
part 'subject.g.dart';

@immutable
@JsonSerializable()
class Subject{
  final int id;
  final String name;
  
  const Subject({required this.id,required this.name});

  factory Subject.fromJson(Map<String, dynamic> json) => _$SubjectFromJson(json);
  Map<String, dynamic> toJson() => _$SubjectToJson(this);

  SubjectState toSubjectState()
    => SubjectState(
        id: id,
        name: name,
        topics: Pagination.init(topicsPerPage,true),
        questions: Pagination.init(questionsPerPage,true)
      );
}