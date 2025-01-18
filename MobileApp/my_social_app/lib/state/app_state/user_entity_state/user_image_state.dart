import 'package:app_file/app_file.dart';
import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/upload_entity_state/upload_status.dart';

@immutable
class UserImageState{
  final AppFile image;
  final double rate;
  final UploadStatus status;

  const UserImageState({required this.image, required this.rate, required this.status});

  UserImageState changeRate(double rate) => 
    UserImageState(
      image: image,
      rate: rate,
      status: status
    );

  UserImageState success() =>
    UserImageState(
      image: image,
      rate: rate, status: UploadStatus.success
    );

  UserImageState failed() => 
    UserImageState(
      image: image,
      rate: rate,
      status: UploadStatus.failed
    );
}