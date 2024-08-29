// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_search.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSearch _$UserSearchFromJson(Map<String, dynamic> json) => UserSearch(
      id: (json['id'] as num).toInt(),
      searcherId: (json['searcherId'] as num).toInt(),
      searchedId: (json['searchedId'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      searcher: json['searcher'] == null
          ? null
          : User.fromJson(json['searcher'] as Map<String, dynamic>),
      searched: json['searched'] == null
          ? null
          : User.fromJson(json['searched'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserSearchToJson(UserSearch instance) =>
    <String, dynamic>{
      'id': instance.id,
      'searcherId': instance.searcherId,
      'searchedId': instance.searchedId,
      'createdAt': instance.createdAt.toIso8601String(),
      'searcher': instance.searcher,
      'searched': instance.searched,
    };
