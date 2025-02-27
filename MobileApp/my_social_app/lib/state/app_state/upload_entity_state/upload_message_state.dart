import 'package:my_social_app/state/app_state/message_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/upload_entity_state/upload_state.dart';
import 'package:my_social_app/state/app_state/upload_entity_state/upload_status.dart';

class UploadMessageState extends UploadState{
  final String? content;
  final num userId;

  UploadMessageState._({
    required super.id,
    required super.medias,
    required super.rate,
    required super.status,
    required this.content,
    required this.userId
  });

  @override
  UploadMessageState changeRate(double rate) => UploadMessageState._(
    id: id,
    medias: medias,
    rate: rate,
    status: status,
    content: content,
    userId: userId
  );

  @override
  UploadMessageState changeStatus(UploadStatus status) => UploadMessageState._(
    id: id,
    medias: medias,
    rate: rate,
    status: status,
    content: content,
    userId: userId
  );

  factory UploadMessageState.init(CreateMessageWithMediasAction action) => UploadMessageState._(
    id: action.id,
    medias: action.medias,
    rate: 0,
    status: UploadStatus.loading,
    content: action.content,
    userId: action.receiverId
  );

}