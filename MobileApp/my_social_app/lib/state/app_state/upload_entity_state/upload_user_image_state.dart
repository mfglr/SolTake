import 'package:my_social_app/state/app_state/upload_entity_state/upload_state.dart';
import 'package:my_social_app/state/app_state/upload_entity_state/upload_status.dart';
import 'package:my_social_app/state/app_state/user_entity_state/actions.dart';

class UploadUserImageState extends UploadState {
  
  UploadUserImageState._({
    required super.id,
    required super.medias,
    required super.rate,
    required super.status
  });

  @override
  UploadState changeRate(double rate) =>
    UploadUserImageState._(
      id: id,
      medias: medias,
      rate: rate,
      status: status
    );

  @override
  UploadState changeStatus(UploadStatus status) =>
    UploadUserImageState._(
      id: id,
      medias: medias,
      rate: rate,
      status: status
    );

  factory UploadUserImageState.init(UpdateUserImageAction action) =>
    UploadUserImageState._(
      id: action.id,
      medias: [action.image],
      rate: 0,
      status: UploadStatus.loading
    );

}