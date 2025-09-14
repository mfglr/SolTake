import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_social_app/state/subject_request_state/subject_request_state.dart';
part 'subject_request.g.dart';

@immutable
@JsonSerializable()
class SubjectRequest {
  final int id;
  final DateTime createdAt;
  final String name;
  final int examId;
  final String examName;
  final int state;
  final int? reason;

  const SubjectRequest({
    required this.id,
    required this.createdAt,
    required this.name,
    required this.examId,
    required this.examName,
    required this.state,
    required this.reason
  });

  factory SubjectRequest.fromJson(Map<String, dynamic> json) => _$SubjectRequestFromJson(json);
  Map<String, dynamic> toJson() => _$SubjectRequestToJson(this);

  SubjectRequestState toState() => SubjectRequestState(
    id: id,
    createdAt: createdAt,
    name: name,
    examId: examId,
    examName: examName,
    state: state,
    reason: reason
  );
}