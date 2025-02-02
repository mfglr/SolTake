import 'package:flutter/material.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/solution/pages/create_solution_by_ai_page/widgets/ai_items.dart';

class CreateSolutionByAiPage extends StatelessWidget {
  final int questionId;
  const CreateSolutionByAiPage({
    super.key,
    required this.questionId
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButtonWidget(),
      ),
      body: AiItems(questionId: questionId,),
    );
  }
}