import 'package:app_file/app_file.dart';
import 'package:flutter/material.dart';
import 'package:multimedia/models/multimedia.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/views/shared/uploading_circle/uploading_file_status.dart';


@immutable
class ChangeUploadingUserImageStatusAction extends AppAction{
  final int userId;
  final UploadingFileStatus status;
  const ChangeUploadingUserImageStatusAction({required this.userId, required this.status});
}
@immutable
class ChangeUploadingUserImageRateAction extends AppAction{
  final int userId;
  final double rate;
  const ChangeUploadingUserImageRateAction({required this.userId, required this.rate});
}

@immutable
class UploadUserImageAction extends AppAction{
  final int userId;
  final AppFile image;
  const UploadUserImageAction({required this.userId, required this.image});
}
@immutable
class UploadUserImageSuccessAction extends AppAction{
  final int userId;
  final Multimedia image;
  const UploadUserImageSuccessAction({
    required this.userId,
    required this.image
  });
}
@immutable
class UploadUserImageFailedAction extends AppAction{
  final int userId;
  const UploadUserImageFailedAction({required this.userId});
}

@immutable
class ChangeUserImageRateAction extends AppAction{
  final int userId;
  final double rate;
  const ChangeUserImageRateAction({required this.userId, required this.rate});
}

@immutable
class RemoveUserImageAction extends AppAction{
  final int userId;
  const RemoveUserImageAction({required this.userId});
}
@immutable
class RemoveUserImageSuccessAction extends AppAction{
  final int userId;
  const RemoveUserImageSuccessAction({required this.userId});
}