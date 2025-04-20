import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/user_item.dart';

@immutable
class UserUserConversationState extends UserItem{

  UserUserConversationState({
    required super.id,
    required super.userId,
    required super.userName,
    required super.name,
    required super.image
  });
}