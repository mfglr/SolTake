import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_social_app/state/app_state/message_connection_entity_state/message_connection_state.dart';
import 'package:my_social_app/state/app_state/message_connection_entity_state/message_connection_status.dart';
part 'message_connection.g.dart';

@JsonSerializable()
@immutable
class MessageConnection{
  final int id;
  final int? typingId;
  final MessageConnectionStatus state;

  const MessageConnection({required this.id, required this.typingId, required this.state});
  
  factory MessageConnection.fromJson(Map<String, dynamic> json) => _$MessageConnectionFromJson(json);
  Map<String, dynamic> toJson() => _$MessageConnectionToJson(this);

  MessageConnectionState toMessageConnectionState() =>
    MessageConnectionState(
      id: id,
      state: state,
      typingId: typingId
    );
    
}