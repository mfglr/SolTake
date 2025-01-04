import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/upload_entity_state/upload_state.dart';
import 'package:my_social_app/state/app_state/upload_entity_state/upload_status.dart';

@immutable
class RemoveUploadStateAction extends AppAction{
  final String id;
  const RemoveUploadStateAction({required this.id});
}

@immutable
class ChangeUploadRateAction extends AppAction{
  final double rate;
  final String id;
  const ChangeUploadRateAction({
    required this.rate,
    required this.id
  });
}

@immutable
class ChangeUploadStatusAction extends AppAction{
  final UploadStatus status;
  final String id;

  const ChangeUploadStatusAction({
    required this.status,
    required this.id
  });
}

@immutable
class ChangeUploadStateAction extends AppAction{
  final UploadState state;
  const ChangeUploadStateAction({required this.state});
}