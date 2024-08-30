import 'package:flutter/material.dart';
import 'package:my_social_app/state/entity_state/entity.dart';

@immutable
class UserSearchState extends Entity{
  final int searcherId;
  final int searchedId;
  final DateTime createdAt;

  const UserSearchState({
    required super.id,
    required this.searcherId,
    required this.searchedId,
    required this.createdAt
  });
}