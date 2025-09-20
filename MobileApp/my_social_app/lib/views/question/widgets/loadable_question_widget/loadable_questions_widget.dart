import 'package:flutter/material.dart';
import 'package:my_social_app/custom_packages/entity_state/containers/loadable_container.dart';
import 'package:my_social_app/state/questions_state/question_state.dart';
import 'package:my_social_app/views/question/widgets/loadable_question_widget/loadable_question_widget.dart';

class LoadableQuestionsWidget extends StatelessWidget {
  final Iterable<LoadableContainer<int, QuestionState<int>>> containers;
  const LoadableQuestionsWidget({
    super.key,
    required this.containers
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: containers
        .map((e) => Container(
          margin: const EdgeInsets.only(bottom: 16),
          child: LoadableQuestionWidget(container: e,),
        ))
        .toList(),
    );
  }
}