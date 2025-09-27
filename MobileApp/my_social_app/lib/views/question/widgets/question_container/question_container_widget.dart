import 'package:flutter/material.dart';
import 'package:my_social_app/state/questions_state/question_state.dart';
import 'package:my_social_app/custom_packages/entity_state/entity_container.dart';
import 'package:my_social_app/custom_packages/entity_state/entity_status.dart';
import 'package:my_social_app/views/question/widgets/question_container/question_container_entity_widget.dart';
import 'package:my_social_app/views/question/widgets/question_container/question_container_loading_widget.dart';
import 'package:my_social_app/views/question/widgets/question_container/question_container_not_load_widget/question_container_not_load_widget.dart';

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
      EntityStatus.loadSuccess => QuestionContainerEntityWidget(container: container),
      EntityStatus.loadFailed => QuestionContainerNotLoadWidget(container: container,),
      EntityStatus.notFound => QuestionContainerNotLoadWidget(container: container),
      EntityStatus.uploading => QuestionContainerEntityWidget(container: container),
      EntityStatus.processing => QuestionContainerEntityWidget(container: container),
      EntityStatus.uploadFailed => QuestionContainerEntityWidget(container: container),
    };
  }
}