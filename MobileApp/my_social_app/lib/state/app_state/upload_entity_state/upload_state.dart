import 'package:app_file/app_file.dart';
import 'package:my_social_app/state/app_state/upload_entity_state/upload_status.dart';

abstract class UploadState{
  final String id;
  final Iterable<AppFile> medias;
  final double rate;
  final UploadStatus status;

  const UploadState({
    required this.id,
    required this.medias,
    required this.rate,
    required this.status
  });

  UploadState changeRate(double rate);
  UploadState changeStatus(UploadStatus status);
}