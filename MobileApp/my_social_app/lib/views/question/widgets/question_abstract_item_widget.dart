import 'package:flutter/material.dart';
import 'package:multimedia_grid/multimedia_grid.dart';
import 'package:my_social_app/constants/assets.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';

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
      child: MultimediaGrid(
        state: question.medias.firstOrNull,
        noMediaPath: noMediaAssetPath,
        notFoundMediaPath: noMediaAssetPath,
        onTap: () => onTap(question.id),
      )
    );
  }
}