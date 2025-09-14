import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_social_app/state/topics_state/topic_state.dart';
part 'topic.g.dart';

@immutable
@JsonSerializable()
class Topic{
  final int id;
  final String name;

  const Topic({required this.id, required this.name});

  factory Topic.fromJson(Map<String, dynamic> json) => _$TopicFromJson(json);
  Map<String, dynamic> toJson() => _$TopicToJson(this);

  TopicState toTopicState()
    => TopicState(
      id: id,
      name: name,
    );
}