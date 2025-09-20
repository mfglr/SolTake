import 'package:flutter/material.dart';
import 'package:my_social_app/state/questions_state/question_state.dart';
import 'package:my_social_app/custom_packages/entity_state/entity_container.dart';
import 'package:my_social_app/custom_packages/entity_state/entity_status.dart';
import 'package:my_social_app/views/question/widgets/question_container/question_container_load_success_widget.dart';
import 'package:my_social_app/views/question/widgets/question_container/question_container_loading_widget.dart';
import 'package:my_social_app/views/question/widgets/question_container/question_container_upload_widget.dart';

class QuestionContainerWidget extends StatelessWidget {
  final EntityContainer<int, QuestionState> container;
  
  const QuestionContainerWidget({
    super.key,
    required this.container
  });

  @override
  Widget build(BuildContext context) {
    return switch(container.status){
      EntityStatus.created => QuestionContainerLoadingWidget(container: container),
      EntityStatus.loading => QuestionContainerLoadingWidget(container: container),
      EntityStatus.loadSuccess => QuestionContainerLoadSuccessWidget(container: container),
      EntityStatus.loadFailed => throw UnimplementedError(),
      EntityStatus.notFound => throw UnimplementedError(),
      EntityStatus.uploading => QuestionContainerUploadWidget(container: container),
      EntityStatus.processing => QuestionContainerUploadWidget(container: container),
      EntityStatus.uploadSuccess => QuestionContainerUploadWidget(container: container),
      EntityStatus.uploadFailed => QuestionContainerUploadWidget(container: container),
    };
  }
}