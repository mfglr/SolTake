import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_social_app/custom_packages/media/models/multimedia.dart';
import 'package:my_social_app/state/user_user_conversation_state/user_user_conversation_state.dart';
part 'user_user_conversation.g.dart';

@immutable
@JsonSerializable()
class UserUserConversation {
  final int id;
  final int userId;
  final String userName;
  final String? name;
  final Multimedia? image;

  const UserUserConversation({
    required this.id,
    required this.userId,
    required this.userName,
    required this.name,
    required this.image
  });

  factory UserUserConversation.fromJson(Map<String, dynamic> json) => _$UserUserConversationFromJson(json);
  Map<String, dynamic> toJson() => _$UserUserConversationToJson(this);

  UserUserConversationState toState() =>
    UserUserConversationState(
      id: id,
      userId: userId,
      userName: userName,
      name: name,
      image: image
    );

}