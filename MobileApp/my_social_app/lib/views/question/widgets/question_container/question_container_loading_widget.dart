import 'package:flutter/material.dart';
import 'package:my_social_app/state/questions_state/question_state.dart';
import 'package:my_social_app/packages/entity_state/entity_container.dart';
import 'package:my_social_app/views/shared/loading_circle_widget.dart';

class QuestionContainerLoadingWidget extends StatelessWidget {
  final EntityContainer<int, QuestionState> container;
  const QuestionContainerLoadingWidget({
    super.key,
    required this.container
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            LoadingCircleWidget(diameter: 80,)
          ],
        )
      ],
    );
  }
}