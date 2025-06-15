import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_social_app/state/app_state/exam_requests_state/exam_request_state.dart';
part 'exam_request.g.dart';

@immutable
@JsonSerializable()
class ExamRequest {
  final int id;
  final String name;
  final String initialism;
  final int state;

  const ExamRequest({
    required this.id,
    required this.name,
    required this.initialism,
    required this.state
  });

  factory ExamRequest.fromJson(Map<String, dynamic> json) => _$ExamRequestFromJson(json);
  Map<String, dynamic> toJson() => _$ExamRequestToJson(this);

  ExamRequestState toState() =>
    ExamRequestState(
      id: id,
      name: name,
      initialism: initialism,
      state: state
    );
}