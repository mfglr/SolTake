import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_social_app/packages/media/models/multimedia.dart';
import 'package:my_social_app/state/search_users_state/search_user_state.dart';
part 'search_user.g.dart';

@JsonSerializable()
@immutable
class SearchUser{
  final int id;
  final String userName;
  final String? name;
  final Multimedia? image;

  const SearchUser({
    required this.id,
    required this.userName,
    required this.name,
    required this.image
  });

  factory SearchUser.fromJson(Map<String, dynamic> json) => _$SearchUserFromJson(json);
  Map<String, dynamic> toJson() => _$SearchUserToJson(this);

  SearchUserState toSearchUserState() 
    => SearchUserState(
        id: id,
        userName: userName,
        name: name,
        image: image
      );
}