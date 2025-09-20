import 'package:flutter/material.dart';
import 'package:my_social_app/custom_packages/entity_state/containers/loadable_container.dart';
import 'package:my_social_app/state/questions_state/question_state.dart';

class LoadableQuestionLoadingWidget extends StatelessWidget {
  final LoadableContainer<int, QuestionState<int>> container;
  
  const LoadableQuestionLoadingWidget({
    super.key,
    required this.container
  });

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Column(
        children: [
          
        ],
      ),
    );
  }
}