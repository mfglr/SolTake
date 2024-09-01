// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'solution_user_vote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SolutionUserVote _$SolutionUserVoteFromJson(Map<String, dynamic> json) =>
    SolutionUserVote(
      id: (json['id'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      solutionId: (json['solutionId'] as num).toInt(),
      appUserId: (json['appUserId'] as num).toInt(),
      appUser: json['appUser'] == null
          ? null
          : User.fromJson(json['appUser'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SolutionUserVoteToJson(SolutionUserVote instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'solutionId': instance.solutionId,
      'appUserId': instance.appUserId,
      'appUser': instance.appUser,
    };
