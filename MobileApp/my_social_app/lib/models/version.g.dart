// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'version.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Version _$VersionFromJson(Map<String, dynamic> json) => Version(
      id: (json['id'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      versionCode: json['versionCode'] as String,
      isUpgradeRequired: json['isUpgradeRequired'] as bool,
    );

Map<String, dynamic> _$VersionToJson(Version instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'versionCode': instance.versionCode,
      'isUpgradeRequired': instance.isUpgradeRequired,
    };
