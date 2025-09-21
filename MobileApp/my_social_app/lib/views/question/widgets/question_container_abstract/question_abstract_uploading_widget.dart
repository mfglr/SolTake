import 'package:flutter/material.dart';
import 'package:my_social_app/custom_packages/media/wigets/media_frame_widget/media_frame_widget.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/state/questions_state/question_state.dart';
import 'package:my_social_app/custom_packages/entity_state/entity_container.dart';

class QuestionAbstractUploadingWidget extends StatelessWidget {
  final EntityContainer<int,QuestionState> container;
  const QuestionAbstractUploadingWidget({
    super.key,
    required this.container
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [
        MediaFrameWidget(
          key: ValueKey(container.key),
          media: container.entity!.medias.first,
          blobService: AppClient.blobService,
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            color: Colors.black.withAlpha(192),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 5),
                child: Text(
                  container.rateToString,
                  style: const TextStyle(
                    color: Colors.white
                  ),
                ),
              ),
              const Icon(
                Icons.file_upload,
                color: Colors.white,
                size: 13
              )
            ],
          ),
        )
      ],
    );
  }
}