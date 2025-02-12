import 'package:flutter/material.dart';
import 'package:multimedia/models/multimedia.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/views/create_solution_by_ai/select_video_frame_page/widgets/frame_catcher.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/app_title.dart';

class SelectVideoFramePage extends StatelessWidget {
  final Multimedia media;
  const SelectVideoFramePage({
    super.key,
    required this.media
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButtonWidget(),
        title: const AppTitle(title: "Select Frame"),
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