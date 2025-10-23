import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_social_app/custom_packages/media/models/multimedia.dart';
part 'create_question.g.dart';

@immutable
@JsonSerializable()
class CreateQuestion {
  final int id;
  final Iterable<Multimedia> medias;

  const CreateQuestion({
    required this.id,
    required this.medias
  });

  factory CreateQuestion.fromJson(Map<String, dynamic> json) => _$CreateQuestionFromJson(json);
  Map<String, dynamic> toJson() => _$CreateQuestionToJson(this);
}