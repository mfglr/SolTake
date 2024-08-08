import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/state/pagination.dart';
import 'package:my_social_app/state/topic_entity_state/topic_state.dart';
part 'topic.g.dart';

@immutable
@JsonSerializable()
class Topic{
  final int id;
  final int subjectId;
  final String name;

  const Topic({required this.id, required this.subjectId, required this.name});

  factory Topic.fromJson(Map<String, dynamic> json) => _$TopicFromJson(json);
  Map<String, dynamic> toJson() => _$TopicToJson(this);

  TopicState toTopicState()
    => TopicState(
      id: id,
      subjectId: subjectId,
      name: name,
      questions: Pagination.init(questionsPerPage)
    );
}