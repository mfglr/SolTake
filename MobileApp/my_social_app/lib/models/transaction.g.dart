// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transaction _$TransactionFromJson(Map<String, dynamic> json) => Transaction(
      id: (json['id'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      balanceId: (json['balanceId'] as num).toInt(),
      numberOfInputToken: (json['numberOfInputToken'] as num).toInt(),
      numberOfOutputToken: (json['numberOfOutputToken'] as num).toInt(),
      solPerInputToken: (json['solPerInputToken'] as num).toInt(),
      solPerOutputToken: (json['solPerOutputToken'] as num).toInt(),
      aiModelName: json['aiModelName'] as String,
      aiModelImage:
          Multimedia.fromJson(json['aiModelImage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'balanceId': instance.balanceId,
      'numberOfInputToken': instance.numberOfInputToken,
      'numberOfOutputToken': instance.numberOfOutputToken,
      'solPerInputToken': instance.solPerInputToken,
      'solPerOutputToken': instance.solPerOutputToken,
      'aiModelName': instance.aiModelName,
      'aiModelImage': instance.aiModelImage,
    };
