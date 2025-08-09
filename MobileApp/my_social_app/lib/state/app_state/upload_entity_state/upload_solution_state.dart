import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/questions_state/question_state.dart';
import 'package:my_social_app/state/app_state/solutions_state/actions.dart';
import 'package:my_social_app/state/app_state/upload_entity_state/upload_state.dart';
import 'package:my_social_app/state/app_state/upload_entity_state/upload_status.dart';

@immutable
class UploadSolutionState extends UploadState{
  final QuestionState question;
  final String? content;

  const UploadSolutionState._({
    required super.id,
    required super.medias,
    required super.rate,
    required super.status,
    required this.question,
    required this.content
  });

  @override
  UploadSolutionState changeRate(double rate) => UploadSolutionState._(
    id: id,
    medias: medias,
    rate: rate,
    status: status,
    question: question,
    content: content
  );

  @override
  UploadSolutionState changeStatus(UploadStatus status) => UploadSolutionState._(
    id: id,
    medias: medias,
    rate: rate,
    status: status,
    question: question,
    content: content
  );

  // factory UploadSolutionState(CreateSolutionAction action) => UploadSolutionState._(
  //   id: action.id,
  //   medias: action.medias, 
  //   rate: 0,
  //   status: UploadStatus.loading,
  //   question: action.question,
  //   content: action.content
  // );
}