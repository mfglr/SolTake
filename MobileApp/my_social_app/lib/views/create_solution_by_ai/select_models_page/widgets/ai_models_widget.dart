import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/ai_model_state/ai_model_state.dart';
import 'package:my_social_app/state/app_state/questions_state/question_state.dart';
import 'package:my_social_app/views/create_solution_by_ai/select_models_page/widgets/ai_model_widget.dart';

class AiModelsWidget extends StatelessWidget {
  final QuestionState question;
  final Iterable<AIModelState> aiModels;
  const AiModelsWidget({
    super.key,
    required this.aiModels,
    required this.question
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: aiModels
        .map((model) => AiModelWidget(aiModel: model, question: question))
        .toList()
    );
  }
}