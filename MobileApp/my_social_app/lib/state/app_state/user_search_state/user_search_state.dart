import 'package:flutter/material.dart';
import 'package:my_social_app/state/entity_state/base_entity.dart';

@immutable
class UserSearchState extends BaseEntity<num>{
  final int searcherId;
  final int searchedId;
  final DateTime createdAt;
  
  UserSearchState({
    required super.id,
    required this.searcherId,
    required this.searchedId, 
    required this.createdAt
  });
}