import 'dart:typed_data';
import 'package:my_social_app/state/app_state/image_status.dart';

class MessageImageState{
  final int messageId;
  final Uint8List? image;
  final ImageStatus status;

  const MessageImageState({
    required this.messageId,
    required this.status,
    required this.image,
  });

  factory MessageImageState.init(int messageId)
    => MessageImageState(
        messageId: messageId,
        status: ImageStatus.notStarted,
        image: null
      );

  MessageImageState startLoading()
    => MessageImageState(
        messageId: messageId,
        status: ImageStatus.started,
        image: image
      );

  MessageImageState load(Uint8List image)
    => MessageImageState(
        messageId: messageId,
        status: ImageStatus.done,
        image: image
      );
}
