// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_user_search.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserUserSearch _$UserUserSearchFromJson(Map<String, dynamic> json) =>
    UserUserSearch(
      id: (json['id'] as num).toInt(),
      userId: (json['userId'] as num).toInt(),
      userName: json['userName'] as String,
      name: json['name'] as String?,
      image: json['image'] == null
          ? null
          : Multimedia.fromJson(json['image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserUserSearchToJson(UserUserSearch instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'userName': instance.userName,
      'name': instance.name,
      'image': instance.image,
    };
