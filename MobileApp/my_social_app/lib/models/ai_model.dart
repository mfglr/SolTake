import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:multimedia/models/multimedia.dart';
import 'package:my_social_app/state/ai_model_state/ai_model_state.dart';
part 'ai_model.g.dart';

@JsonSerializable()
@immutable
class AIModel {
  final int id;
  final String name;
  final int solPerInputToken;
  final int solPerOutputToken;
  final Multimedia image;

  const AIModel({
    required this.id,
    required this.name,
    required this.solPerInputToken,
    required this.solPerOutputToken,
    required this.image
  });


  factory AIModel.fromJson(Map<String, dynamic> json) => _$AIModelFromJson(json);
  Map<String, dynamic> toJson() => _$AIModelToJson(this);

  AIModelState toState() => 
    AIModelState(
      id: id,
      name: name,
      solPerInputToken: solPerInputToken,
      solPerOutputToken: solPerOutputToken,
      image: image
    );
}