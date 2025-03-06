import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:multimedia/models/multimedia.dart';
import 'package:my_social_app/state/app_state/user_user_search_state/user_user_search_state.dart';
part 'user_user_search.g.dart';

@immutable
@JsonSerializable()
class UserUserSearch{
  final int id;
  final int searchedId;
  final String userName;
  final String? name;
  final Multimedia? image;
  
  const UserUserSearch({
    required this.id, 
    required this.searchedId,
    required this.userName,
    required this.name,
    required this.image
  });


  factory UserUserSearch.fromJson(Map<String, dynamic> json) => _$UserUserSearchFromJson(json);
  Map<String, dynamic> toJson() => _$UserUserSearchToJson(this);

  UserUserSearchState toUserUserSearchState()
    => UserUserSearchState(
      id: id,
      searchedId: searchedId,
      userName: userName,
      name: name,
      image: image
    );
}