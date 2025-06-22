import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:multimedia/models/multimedia.dart';
import 'package:soltake_broker/state/app_state/question_user_complaints_state/question_user_complaint_state.dart';
part 'question_user_complaint.g.dart';

@JsonSerializable()
@immutable
class QuestionUserComplaint {
  final int id;
  final DateTime createdAt;
  final int reason;
  final String? content;
  final Iterable<Multimedia> medias;
  final String? questionContent;

  const QuestionUserComplaint({
    required this.id,
    required this.createdAt,
    required this.reason,
    required this.content,
    required this.medias,
    required this.questionContent
  });

  factory QuestionUserComplaint.fromJson(Map<String, dynamic> json) => _$QuestionUserComplaintFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionUserComplaintToJson(this);

  QuestionUserComplaintState toState() => 
    QuestionUserComplaintState(
      id: id,
      createdAt: createdAt,
      medias: medias,
      content: content,
      questionContent: questionContent,
      reason: reason
    );

}