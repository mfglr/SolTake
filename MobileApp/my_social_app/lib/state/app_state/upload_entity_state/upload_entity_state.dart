import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/upload_entity_state/upload_message_state.dart';
import 'package:my_social_app/state/app_state/upload_entity_state/upload_question_state.dart';
import 'package:my_social_app/state/app_state/upload_entity_state/upload_solution_state.dart';
import 'package:my_social_app/state/app_state/upload_entity_state/upload_state.dart';
import 'package:my_social_app/state/app_state/upload_entity_state/upload_status.dart';

@immutable
class UploadEntityState {
  final Iterable<UploadState> entities;

  const UploadEntityState._({required this.entities});

  factory UploadEntityState.init() => const UploadEntityState._(entities: Iterable.empty());

  UploadEntityState changeRate(double rate,String id) =>
    UploadEntityState._(entities: entities.map((e) => e.id == id ? e.changeRate(rate) : e));
  
  UploadEntityState changeStatus(UploadStatus status,String id) =>
    UploadEntityState._(entities: entities.map((e) => e.id == id ? e.changeStatus(status) : e));

  UploadEntityState changeState(UploadState state) => 
    UploadEntityState._(
      entities: entities.any((e) => e.id == state.id) 
        ? entities.map((e) => e.id == state.id ? state : e)
        : [state,...entities]
    );

  UploadEntityState remove(String id)
    => UploadEntityState._(entities: entities.where((e) => e.id != id));

  UploadState get(String id) => entities.firstWhere((e) => e.id == id);
  Iterable<UploadState> getUploadSolutions(num questionId) => entities.whereType<UploadSolutionState>();
  Iterable<UploadState> get getUploadQuestions => entities.whereType<UploadQuestionState>();
  Iterable<UploadState> getUploadMessages(num userId) => entities.where((e) => e is UploadMessageState && e.userId == userId);
  int get length => entities.length;
}