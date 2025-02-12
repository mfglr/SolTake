import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/create_solution_by_ai/display_models_page/widgets/ai_items.dart';

class DisplayModelsPage extends StatelessWidget {
  final QuestionState question;
  const DisplayModelsPage({
    super.key,
    required this.question
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButtonWidget(),
      ),
      body: AiItems(question: question,),
    );
  }
}