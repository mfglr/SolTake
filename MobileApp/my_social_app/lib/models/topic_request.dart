import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_social_app/state/topic_requests_state/topic_request_state.dart';
part 'topic_request.g.dart';

@immutable
@JsonSerializable()
class TopicRequest {
  final int id;
  final DateTime createdAt;
  final String subjectName;
  final String name;
  final int state;
  final int? reason;

  const TopicRequest({
    required this.id,
    required this.createdAt,
    required this.subjectName,
    required this.name,
    required this.state,
    required this.reason
  });

  factory TopicRequest.fromJson(Map<String, dynamic> json) => _$TopicRequestFromJson(json);
  Map<String, dynamic> toJson() => _$TopicRequestToJson(this);

  TopicRequestState toState() =>
    TopicRequestState(
      id: id,
      createdAt: createdAt,
      subjectName: subjectName,
      name: name,
      state: state,
      reason: reason
    );
}