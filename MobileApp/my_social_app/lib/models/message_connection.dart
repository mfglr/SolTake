import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:multimedia/models/multimedia.dart';
import 'package:my_social_app/state/app_state/message_connection_entity_state/message_connection_state.dart';
part 'message_connection.g.dart';

@JsonSerializable()
@immutable
class MessageConnection{
  final int id;
  final DateTime? updatedAt;
  final String userName;
  final Multimedia? image;
  final int? typingId;
  final int state;

  const MessageConnection({
    required this.id,
    required this.updatedAt,
    required this.userName,
    required this.image,
    required this.typingId,
    required this.state
  });
  
  factory MessageConnection.fromJson(Map<String, dynamic> json) => _$MessageConnectionFromJson(json);
  Map<String, dynamic> toJson() => _$MessageConnectionToJson(this);

  MessageConnectionState toMessageConnectionState() =>
    MessageConnectionState(
      id: id,
      updatedAt: updatedAt,
      userName: userName,
      image: image,
      state: state,
      typingId: typingId
    );
    
}