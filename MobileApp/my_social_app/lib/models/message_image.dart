import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
part 'message_image.g.dart';

@immutable
@JsonSerializable()
class MessageImage{
  final int id;
  final int messageId;
  final String blobName;
  final int height;
  final int width;

  const MessageImage({
    required this.id,
    required this.messageId,
    required this.blobName,
    required this.height,
    required this.width
  });

  factory MessageImage.fromJson(Map<String, dynamic> json) => _$MessageImageFromJson(json);
  Map<String, dynamic> toJson() => _$MessageImageToJson(this);
}