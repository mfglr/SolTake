import 'package:flutter/material.dart';
import 'package:multimedia_grid/multimedia_grid.dart';
import 'package:my_social_app/constants/assets.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/state/app_state/questions_state/question_user_save_state.dart';

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
      child: MultimediaGrid(
        state: questionUserSave.medias.firstOrNull,
        blobServiceUrl: AppClient.blobService,
        noMediaPath: noMediaAssetPath,
        notFoundMediaPath: noMediaAssetPath,
        onTap: () => onTap(questionUserSave.id),
      )
    );
  }
}