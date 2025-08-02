import 'package:app_file/app_file.dart';
import 'package:flutter/material.dart';
import 'package:multimedia/models/multimedia.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/views/shared/uploading_circle/uploading_file_status.dart';


@immutable
class UpdateUserNameAction extends AppAction{
  final String userName;
  const UpdateUserNameAction({required this.userName});
}
@immutable
class UpdateUserNameSuccessAction extends AppAction{
  final int userId;
  final String userName;
  const UpdateUserNameSuccessAction({required this.userId,required this.userName});
}

@immutable
class UpdateNameAction extends AppAction{
  final String name;
  const UpdateNameAction({required this.name});
}
@immutable
class UpdateNameSuccessAction extends AppAction{
  final int userId;
  final String name;
  const UpdateNameSuccessAction({required this.userId, required this.name});
}

@immutable
class UpdateBiographyAction extends AppAction{
  final String biography;
  const UpdateBiographyAction({required this.biography});
}
@immutable
class UpdateBiographySuccessAction extends AppAction{
  final int userId;
  final String biography;
  const UpdateBiographySuccessAction({required this.userId, required this.biography});
}

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