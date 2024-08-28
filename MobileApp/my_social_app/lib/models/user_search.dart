import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_social_app/state/pagination/has_pagination_property.dart';
part 'user_search.g.dart';

@immutable
@JsonSerializable()
class UserSearch extends HasPaginationProperty<num>{
  final int userId;
  
  const UserSearch({
    required super.key,
    required this.userId
  });

  factory UserSearch.fromJson(Map<String, dynamic> json) => _$UserSearchFromJson(json);
  Map<String, dynamic> toJson() => _$UserSearchToJson(this);
}