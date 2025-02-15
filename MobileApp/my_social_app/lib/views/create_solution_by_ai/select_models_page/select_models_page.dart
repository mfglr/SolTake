import 'package:flutter/material.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/views/create_solution_by_ai/select_models_page/select_models_page_texts.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/create_solution_by_ai/select_models_page/widgets/ai_items.dart';
import 'package:my_social_app/views/shared/app_title.dart';

class SelectModelsPage extends StatelessWidget {
  final QuestionState question;
  const SelectModelsPage({
    super.key,
    required this.question
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButtonWidget(),
        title: AppTitle(title: appTitle[getLanguage(context)]!),
      ),
      body: AiItems(question: question,),
    );
  }
}