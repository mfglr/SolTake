// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_search.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSearch _$UserSearchFromJson(Map<String, dynamic> json) => UserSearch(
      key: json['key'] as num,
      userId: (json['userId'] as num).toInt(),
    );

Map<String, dynamic> _$UserSearchToJson(UserSearch instance) =>
    <String, dynamic>{
      'key': instance.key,
      'userId': instance.userId,
    };
