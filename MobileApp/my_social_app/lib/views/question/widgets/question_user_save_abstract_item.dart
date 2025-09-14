import 'package:flutter/material.dart';
import 'package:my_social_app/packages/media/wigets/medias_grid/media_grid.dart';
import 'package:my_social_app/state/questions_state/question_user_save_state.dart';

class QuestionUserSaveAbstractItem extends StatelessWidget {
  final QuestionUserSaveState questionUserSave;
  final void Function(int questionId) onTap;
  const QuestionUserSaveAbstractItem({
    super.key,
    required this.questionUserSave,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: ValueKey(questionUserSave.id),
      padding: const EdgeInsets.all(1.0),
      child: MediaGrid(
        media: questionUserSave.medias.first,
      )
    );
  }
}