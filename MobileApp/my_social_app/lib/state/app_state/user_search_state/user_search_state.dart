import 'package:flutter/material.dart';

@immutable
class UserSearchState{
  final int id;
  final int searcherId;
  final int searchedId;
  final DateTime createdAt;
  
  const UserSearchState({
    required this.id,
    required this.searcherId,
    required this.searchedId, 
    required this.createdAt
  });
}