import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:multimedia/models/multimedia.dart';
part 'user_user_block.g.dart';

@immutable
@JsonSerializable()
class UserUserBlock {
  final int id;
  final String userName;
  final String? name;
  final Multimedia? image;

  const UserUserBlock({required this.id, required this.userName, required this.name, required this.image});

  factory UserUserBlock.fromJson(Map<String, dynamic> json) => _$UserUserBlockFromJson(json);
  Map<String, dynamic> toJson() => _$UserUserBlockToJson(this);
}