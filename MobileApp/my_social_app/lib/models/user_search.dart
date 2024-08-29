import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_social_app/models/user.dart';
import 'package:my_social_app/state/app_state/search_state/user_search_state.dart';
part 'user_search.g.dart';

@immutable
@JsonSerializable()
class UserSearch{
  final int id;
  final int searcherId;
  final int searchedId;
  final DateTime createdAt;
  final User? searcher;
  final User? searched;
  
  const UserSearch({
    required this.id, 
    required this.searcherId,
    required this.searchedId,
    required this.createdAt,
    required this.searcher,
    required this.searched
  });


  factory UserSearch.fromJson(Map<String, dynamic> json) => _$UserSearchFromJson(json);
  Map<String, dynamic> toJson() => _$UserSearchToJson(this);

  UserSearchState toUserSearchState()
    => UserSearchState(
      id: id,
      searcherId: searcherId,
      searchedId: searchedId,
      createdAt: createdAt
    );
}