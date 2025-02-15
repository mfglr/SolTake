import 'package:flutter/material.dart';
import 'package:my_social_app/constants/ai_models.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/views/create_solution_by_ai/select_models_page/widgets/ai_item.dart';

class AiItems extends StatelessWidget {
  final QuestionState question;
  const AiItems({
    super.key,
    required this.question
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: models
        .map((model) => AiItem(model: model, question: question))
        .toList()
    );
  }
}