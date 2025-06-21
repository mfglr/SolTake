import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
part 'id_response.g.dart';

@JsonSerializable()
@immutable
class IdResponse {
  final int id;
  const IdResponse({required this.id});

  factory IdResponse.fromJson(Map<String, dynamic> json) => _$IdResponseFromJson(json);
  Map<String, dynamic> toJson() => _$IdResponseToJson(this);
}