import 'package:flutter/material.dart';
import 'package:multimedia_grid/multimedia_grid.dart';
import 'package:my_social_app/constants/assets.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/state/app_state/message_entity_state/message_state.dart';
import 'package:my_social_app/views/message/pages/display_message_images_page/display_message_images_page.dart';

class MessageImagesGridWidget extends StatelessWidget {
  final MessageState message;
  final Iterable<int> selectedMessageIds;
  final void Function(int messageId) onSelectedMessageItem;
  const MessageImagesGridWidget({
    super.key,
    required this.message,
    required this.selectedMessageIds,
    required this.onSelectedMessageItem
  });

  void _displayMessageMedias(int index,BuildContext context){
    Navigator
      .of(context)
      .push(MaterialPageRoute(builder: (context) => DisplayMessageImagesPage(message: message,activeIndex: index)));
  }

  @override
  Widget build(BuildContext context) {
    return
      message.medias.length == 1 
        ? MultimediaGrid(
            state: message.medias.first,
            blobServiceUrl: AppClient.blobService,
            noMediaPath: noMediaAssetPath,
            notFoundMediaPath: noMediaAssetPath,
            aspectRatio: message.medias.first.aspectRatio,
            onTap: () => _displayMessageMedias(0,context),
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
                onTap: () => _displayMessageMedias(index, context)
              )
            ),
          );
  }
}