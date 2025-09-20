import 'package:flutter/material.dart';
import 'package:my_social_app/custom_packages/media/wigets/medias_grid/media_grid.dart';
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
    return MediaGrid(
      key: ValueKey(container.key),
      media: container.entity!.medias.first,
    );
  }
}