import 'package:app_file/app_file.dart';
import 'package:flutter/material.dart';
import 'package:my_social_app/views/shared/uploading_circle/uploading_file_status.dart';

@immutable
class UploadingUserImageState {
  final AppFile file;
  final UploadingFileStatus status;
  final double rate;

  const UploadingUserImageState({
    required this.file,
    required this.status,
    required this.rate
  });

  UploadingUserImageState changeStatus(UploadingFileStatus status)
    => UploadingUserImageState(
        file: file,
        status: status,
        rate: rate
      );
  UploadingUserImageState changeRate(double rate)
    => UploadingUserImageState(
        file: file,
        status: UploadingFileStatus.loading,
        rate: rate
      );
}