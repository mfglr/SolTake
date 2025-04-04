import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/user_item.dart';

@immutable
class StoryUserViewState extends UserItem{
  final DateTime createdAt;
  StoryUserViewState({
    required super.id,
    required super.userId,
    required super.userName,
    required super.name,
    required super.image,
    required this.createdAt
  });
}