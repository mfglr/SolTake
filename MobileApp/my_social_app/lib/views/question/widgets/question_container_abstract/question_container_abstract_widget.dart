import 'package:flutter/material.dart';
import 'package:my_social_app/custom_packages/entity_state/containers/load_status.dart';
import 'package:my_social_app/custom_packages/entity_state/containers/loadable_container.dart';
import 'package:my_social_app/state/questions_state/question_state.dart';
import 'package:my_social_app/custom_packages/entity_state/entity_container.dart';
import 'package:my_social_app/custom_packages/entity_state/entity_status.dart';
import 'package:my_social_app/views/question/widgets/question_container_abstract/question_abstract_load_failed_widget.dart';
import 'package:my_social_app/views/question/widgets/question_container_abstract/question_abstract_load_success_widget.dart';
import 'package:my_social_app/views/question/widgets/question_container_abstract/question_abstract_processing_widget.dart';
import 'package:my_social_app/views/question/widgets/question_container_abstract/question_abstract_upload_success_widget.dart';
import 'package:my_social_app/views/question/widgets/question_container_abstract/question_abstract_uploading_widget.dart';
import 'package:my_social_app/views/question/widgets/question_container_abstract/question_container_abstract_loading_widget.dart';

class QuestionContainerAbstractWidget extends StatelessWidget {
  final LoadableContainer<int, QuestionState> container;
  final void Function(LoadableContainer<int,QuestionState> container) onTap;
  
  const QuestionContainerAbstractWidget({
    super.key,
    required this.container,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(container),
      key: ValueKey(container.key),
      child: Builder(
        builder: (context) {
          return switch(container.status){
            // EntityStatus.created => const QuestionContainerAbstractLoadingWidget(),
            // EntityStatus.loading => const QuestionContainerAbstractLoadingWidget(),
            // EntityStatus.loadSuccess => QuestionAbstractLoadSuccessWidget(container: container),
            // EntityStatus.loadFailed => QuestionAbstractLoadFailedWidget(container: container),
            // EntityStatus.notFound => throw UnimplementedError(),
            // EntityStatus.uploading => QuestionAbstractUploadingWidget(container: container),
            // EntityStatus.processing => QuestionAbstractProcessingWidget(container: container,),
            // EntityStatus.uploadSuccess => QuestionAbstractUploadSuccessWidget(container: container,),
            // EntityStatus.uploadFailed => throw UnimplementedError(),
            LoadStatus.pending => throw UnimplementedError(),
            LoadStatus.loading => throw UnimplementedError(),
            LoadStatus.success => throw UnimplementedError(),
            LoadStatus.failed => throw UnimplementedError(),
            LoadStatus.notFound => throw UnimplementedError(),
          };
        }
      ),
    );
  }
}