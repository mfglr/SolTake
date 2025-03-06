// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_user_search.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserUserSearch _$UserUserSearchFromJson(Map<String, dynamic> json) =>
    UserUserSearch(
      id: (json['id'] as num).toInt(),
      searchedId: (json['searchedId'] as num).toInt(),
      userName: json['userName'] as String,
      name: json['name'] as String?,
      image: json['image'] == null
          ? null
          : Multimedia.fromJson(json['image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserUserSearchToJson(UserUserSearch instance) =>
    <String, dynamic>{
      'id': instance.id,
      'searchedId': instance.searchedId,
      'userName': instance.userName,
      'name': instance.name,
      'image': instance.image,
    };
