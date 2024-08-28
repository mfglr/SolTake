import 'package:flutter/material.dart';
import 'package:my_social_app/state/pagination/has_pagination_property.dart';

@immutable
class UserSearchState extends HasPaginationProperty<num>{
  final int searchedId;
  final int createdAt;

  const UserSearchState({
    required super.key,
    required this.searchedId,
    required this.createdAt
  });
}