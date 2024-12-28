import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/upload_entity_state/upload_state.dart';
import 'package:my_social_app/state/app_state/upload_entity_state/upload_status.dart';

@immutable
class UploadEntityState {
  final Iterable<UploadState> entities;

  const UploadEntityState._({required this.entities});

  factory UploadEntityState.init() => const UploadEntityState._(entities: Iterable.empty());

  UploadEntityState changeRate(double rate,String id)
    => UploadEntityState._(entities: entities.map((e) => e.id == id ? e.changeRate(rate) : e));
  
  UploadEntityState changeStatus(UploadStatus status,String id)
    => UploadEntityState._(entities: entities.map((e) => e.id == id ? e.changeStatus(status) : e));

  UploadEntityState addState(UploadState state)
    => UploadEntityState._(entities: [state,...entities]);

  UploadState get(String id) => entities.firstWhere((e) => e.id == id);

  int get length => entities.length;
}