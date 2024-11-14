import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
part "version.g.dart";

@immutable
@JsonSerializable()
class Version{
  final int id;
  final DateTime createdAt;
  final String versionCode;
  final bool isUpgradeRequired;

  const Version({
    required this.id,
    required this.createdAt,
    required this.versionCode,
    required this.isUpgradeRequired
  });

  factory Version.fromJson(Map<String, dynamic> json) => _$VersionFromJson(json);
  Map<String, dynamic> toJson() => _$VersionToJson(this);
}