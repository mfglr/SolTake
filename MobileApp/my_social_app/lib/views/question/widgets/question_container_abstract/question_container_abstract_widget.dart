import 'package:flutter/material.dart';
import 'package:my_social_app/custom_packages/media/models/media.dart';
import 'package:my_social_app/custom_packages/media/wigets/media_frame_widget/media_frame_widget.dart';
import 'package:my_social_app/custom_packages/status_widgets/failed_widget.dart';
import 'package:my_social_app/custom_packages/status_widgets/loading_widget.dart';
import 'package:my_social_app/custom_packages/status_widgets/not_found_widget.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/state/questions_state/question_state.dart';
import 'package:my_social_app/custom_packages/entity_state/entity_container.dart';
import 'package:my_social_app/custom_packages/entity_state/entity_status.dart';
import 'package:my_social_app/views/shared/entity_container_upload_status/entity_container_upload_status.dart';

class QuestionContainerAbstractWidget extends StatelessWidget {
  final EntityContainer<int, QuestionState> container;
  
  const QuestionContainerAbstractWidget({
    super.key,
    required this.container,
  });

  Media get _getMedia => container.entity!.medias.first;


  @override
  Widget build(BuildContext context) {
    return switch(container.status){
      EntityStatus.created => const LoadingWidget(),
      EntityStatus.loading => const LoadingWidget(),
      EntityStatus.loadSuccess => MediaFrameWidget(
        blobService: AppClient.blobService,
        media: _getMedia,
      ),
      EntityStatus.loadFailed => const FailedWidget(),
      EntityStatus.notFound => const NotFoundWidget(),
      EntityStatus.uploading || EntityStatus.processing || EntityStatus.uploadFailed => Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          MediaFrameWidget(
            blobService: AppClient.blobService,
            media: _getMedia,
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: EntityContainerUploadStatus(
              container: container,
              diameter: 50,
            ),
          )
        ],
      )
    };
  }
}