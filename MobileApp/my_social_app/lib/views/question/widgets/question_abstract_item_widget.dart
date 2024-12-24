import 'package:flutter/material.dart';
import 'package:multimedia_state/multimedia_state.dart';
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
        state: question.medias.firstOrNull,
        onTap: () => onTap(question.id),
        centerChild: 
          question.medias.firstOrNull?.multimediaType == MultimediaType.video
            ? Container(
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(128),
                shape: BoxShape.circle
              ),
              child: const Icon(
                Icons.play_arrow_rounded,
                color: Colors.white,
                size: 40,
              ),
            )
            : null,
      ),
    );
  }
}