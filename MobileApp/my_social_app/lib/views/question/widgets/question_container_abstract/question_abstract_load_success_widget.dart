import 'package:flutter/material.dart';
import 'package:my_social_app/custom_packages/media/wigets/media_frame_widget/media_frame_widget.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/state/questions_state/question_state.dart';
import 'package:my_social_app/custom_packages/entity_state/entity_container.dart';

class QuestionAbstractLoadSuccessWidget extends StatelessWidget {
  final EntityContainer<int, QuestionState> container;
  
  const QuestionAbstractLoadSuccessWidget({
    super.key,
    required this.container,
  });

  @override
  Widget build(BuildContext context) {
    return MediaFrameWidget(
      key: ValueKey(container.key),
      media: container.entity!.medias.first,
      blobService: AppClient.blobService,
    );
  }
}