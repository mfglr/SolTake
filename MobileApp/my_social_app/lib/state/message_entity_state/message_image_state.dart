import 'dart:typed_data';
import 'package:my_social_app/state/image_status.dart';

class MessageImageState{
  final int id;
  final int messageId;
  final String blobName;
  final double height;
  final double width;
  final Uint8List? image;
  final ImageStatus status;

  const MessageImageState({
    required this.id,
    required this.messageId,
    required this.blobName,
    required this.height,
    required this.width,
    required this.status,
    required this.image,
  });

  MessageImageState startLoading()
    => MessageImageState(
        id: id,
        messageId: messageId,
        blobName: blobName,
        height: height,
        width: width,
        status: ImageStatus.started,
        image: image
      );

  MessageImageState load(Uint8List image)
    => MessageImageState(
        id: id,
        messageId: messageId,
        blobName: blobName,
        height: height,
        width: width,
        status: ImageStatus.done,
        image: image
      );
}
