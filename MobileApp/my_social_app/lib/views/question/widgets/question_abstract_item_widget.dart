import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/views/shared/image_grid/image_grid.dart';

class QuestionAbstractItemWidget extends StatelessWidget {
  final QuestionState question;
  final void Function(int questionId) onTap;
  
  const QuestionAbstractItemWidget({
    super.key,
    required this.question,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: ValueKey(question.id),
      padding: const EdgeInsets.all(1.0),
      child: ImageGrid(
        state: question.medias.first,
        onTap: () => onTap(question.id),
      ),
    );
  }
}