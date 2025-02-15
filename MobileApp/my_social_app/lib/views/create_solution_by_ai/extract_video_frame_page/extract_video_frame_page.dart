import 'package:flutter/material.dart';
import 'package:multimedia/models/multimedia.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/views/create_solution_by_ai/extract_video_frame_page/extract_video_frame_page_texts.dart';
import 'package:my_social_app/views/create_solution_by_ai/extract_video_frame_page/widgets/frame_catcher.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/app_title.dart';

class ExtractVideoFramePage extends StatelessWidget {
  final Multimedia media;
  const ExtractVideoFramePage({
    super.key,
    required this.media
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButtonWidget(),
        title: AppTitle(title: title[getLanguage(context)]!),
      ),
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          FrameCatcher(
            baseBlobUrl: AppClient.blobService,
            media: media,
          )
        ],
      ),
    );
  }
}