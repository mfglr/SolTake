import 'package:flutter/material.dart';
import 'package:my_social_app/custom_packages/entity_state/containers/base_container.dart';
import 'package:my_social_app/custom_packages/entity_state/containers/loadable_container.dart';
import 'package:my_social_app/custom_packages/entity_state/containers/uploadable_container.dart';
import 'package:my_social_app/state/questions_state/question_state.dart';
import 'package:my_social_app/views/question/widgets/question_container_abstract_widget/loadable_question_abstract_widget.dart';
import 'package:my_social_app/views/question/widgets/question_container_abstract_widget/uploadable_question_abstract_widget.dart';

class QuestionContainerAbstractWidget extends StatelessWidget {
  final BaseContainer container;
  const QuestionContainerAbstractWidget({
    super.key,
    required this.container
  });

  @override
  Widget build(BuildContext context) {
    if(container is LoadableContainer<int, QuestionState<int>>){
      return LoadableQuestionAbstractWidget(
        container: container as LoadableContainer<int, QuestionState<int>>
      );
    }
    else{
      return UploadableQuestionAbstractWidget(
        container: container as UploadableContainer<String, QuestionState<String>>
      );
    }
  }
}