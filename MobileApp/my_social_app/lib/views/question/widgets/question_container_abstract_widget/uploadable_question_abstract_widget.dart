import 'package:flutter/material.dart';
import 'package:my_social_app/custom_packages/entity_state/containers/upload_status.dart';
import 'package:my_social_app/custom_packages/entity_state/containers/uploadable_container.dart';
import 'package:my_social_app/custom_packages/media/wigets/medias_grid/media_grid.dart';
import 'package:my_social_app/state/questions_state/question_state.dart';
import 'package:my_social_app/views/question/widgets/question_container_abstract_widget/uploadable_question_status_widget.dart';
import 'package:my_social_app/views/shared/loading_widgets/loading_rectangle_widget.dart';

class UploadableQuestionAbstractWidget extends StatelessWidget {
  final UploadableContainer<String, QuestionState<String>> container;
  final void Function(UploadableContainer<String, QuestionState<String>>)? onTap;

  const UploadableQuestionAbstractWidget({
    super.key,
    required this.container,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return switch(container.status){
      UploadStatus.pending => const LoadingRectangleWidget(),
      UploadStatus.uploading || UploadStatus.processing || UploadStatus.failed =>
        Stack(
          alignment: Alignment.centerRight,
          children: [
            MediaGrid(
              media: container.entity!.medias.first
            ),
            UploadableQuestionStatusWidget(container: container)
          ],
        ),
    };
  }
}