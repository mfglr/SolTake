import 'package:flutter/material.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/views/solution/widgets/no_pending_solutions_widget/no_pending_solutions_widget_constants.dart';

class NoPendingSolutionsWidget extends StatelessWidget {
  final QuestionState question;
  const NoPendingSolutionsWidget({
    super.key,
    required this.question
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          noPendingSolutions[getLanguage(context)]!,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 30
          ),
        )
      ],
    );
  }
}