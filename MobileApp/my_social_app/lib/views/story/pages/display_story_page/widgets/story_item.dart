import 'package:flutter/material.dart';
import 'package:multimedia_slider/widgets/multimedia_image_player.dart';
import 'package:my_social_app/constants/assets.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/state/app_state/story_state/story_state.dart';

class StoryItem extends StatelessWidget {
  final StoryState story;
  const StoryItem({
    super.key,
    required this.story
  });

  @override
  Widget build(BuildContext context) {
    return MultimediaImagePlayer(
      media: story.media,
      blobServiceUrl: AppClient.blobService,
      notFoundImagePath: noMediaAssetPath,
      noImagePath: noMediaAssetPath,
    );
  }
}