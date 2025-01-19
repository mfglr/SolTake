import 'package:flutter/material.dart';
import 'package:multimedia_grid/multimedia_grid.dart';
import 'package:my_social_app/constants/assets.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/state/app_state/message_entity_state/message_state.dart';

class MessageImagesGridWidget extends StatelessWidget {
  final MessageState message;
  final void Function(MessageState message, {int activeIndex}) onPressedMessageItem;
  const MessageImagesGridWidget({
    super.key,
    required this.message,
    required this.onPressedMessageItem
  });


  @override
  Widget build(BuildContext context) {
    return
      message.medias.length == 1 
        ? MultimediaGrid(
            state: message.medias.first,
            blobServiceUrl: AppClient.blobService,
            headers: AppClient().getHeader(),
            noMediaPath: noMediaAssetPath,
            notFoundMediaPath: noMediaAssetPath,
            aspectRatio: message.medias.first.aspectRatio,
            onTap: () => onPressedMessageItem(message,activeIndex: 0),
          )
        : Padding(
            padding: const EdgeInsets.all(2.0),
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
              ),
              itemCount: message.medias.length,
              itemBuilder:(context, index) => MultimediaGrid(
                state: message.medias.elementAt(index),
                blobServiceUrl: AppClient.blobService,
                noMediaPath: noMediaAssetPath,
                notFoundMediaPath: noMediaAssetPath,
                onTap: () => onPressedMessageItem(message,activeIndex: index)
              )
            ),
          );
  }
}