import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/models/message.dart';
import 'package:my_social_app/state/conversation_entity_state/conversation_state.dart';
import 'package:my_social_app/state/ids.dart';
part 'conversation.g.dart';

@immutable
@JsonSerializable()
class Conversation{
  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int userId;
  final String userName;
  final String? name;
  final Iterable<Message> messages;

  const Conversation({
    required this.id,
    required this.userId,
    required this.userName,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.messages
  });

  factory Conversation.fromJson(Map<String, dynamic> json) => _$ConversationFromJson(json);
  Map<String, dynamic> toJson() => _$ConversationToJson(this);

  ConversationState toConversationState()
   => ConversationState(
      id: id,
      userId: userId,
      name: name,
      userName: userName,
      createdAt: createdAt,
      updatedAt: updatedAt,
      messages: Ids(
        ids: messages.map((e) => e.id),
        isLast: messages.length < messagesPerPage,
        lastValue: messages.isNotEmpty ? messages.last.id : null,
        recordsPerPage: messagesPerPage
      )
    );

    ConversationState toConversationStateWithoutPagination()
      => ConversationState(
        id: id,
        userId: userId,
        name: name,
        userName: userName,
        createdAt: createdAt,
        updatedAt: updatedAt,
        messages: Ids(
          ids: messages.map((e) => e.id),
          isLast: false,
          lastValue: messages.isNotEmpty ? messages.last.id : null,
          recordsPerPage: messagesPerPage
        )
      );
     
}