import 'package:flutter/material.dart';
import 'package:my_social_app/constants/ai_models.dart';
import 'package:my_social_app/views/solution/pages/create_solution_by_ai_page/widgets/ai_item.dart';

class AiItems extends StatelessWidget {
  final int questionId;
  const AiItems({
    super.key,
    required this.questionId
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: models
        .map((model) => AiItem(model: model, questionId: questionId))
        .toList()
    );
  }
}