import 'package:flutter/material.dart';
import 'package:my_social_app/state/user_item.dart';

@immutable
class UserUserBlockState extends UserItem{

  UserUserBlockState({
    required super.id,
    required super.userId,
    required super.userName,
    required super.name,
    required super.image
  });
}