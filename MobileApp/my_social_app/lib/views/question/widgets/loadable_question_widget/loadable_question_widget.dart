import 'package:flutter/material.dart';
import 'package:my_social_app/custom_packages/entity_state/containers/load_status.dart';
import 'package:my_social_app/custom_packages/entity_state/containers/loadable_container.dart';
import 'package:my_social_app/state/questions_state/question_state.dart';
import 'package:my_social_app/views/question/widgets/loadable_question_widget/loadable_question_loading_widget.dart';
import 'package:my_social_app/views/question/widgets/loadable_question_widget/loadable_question_sucess_widget.dart';

class LoadableQuestionWidget extends StatelessWidget {
  final LoadableContainer<int, QuestionState<int>> container;
  
  const LoadableQuestionWidget({
    super.key,
    required this.container
  });

  @override
  Widget build(BuildContext context) {
    return switch(container.status){
      LoadStatus.pending => LoadableQuestionLoadingWidget(container: container),
      LoadStatus.loading => LoadableQuestionLoadingWidget(container: container),
      LoadStatus.success => LoadableQuestionSucessWidget(container: container),
      LoadStatus.failed => throw UnimplementedError(),
      LoadStatus.notFound => throw UnimplementedError(),
    };
  }
}