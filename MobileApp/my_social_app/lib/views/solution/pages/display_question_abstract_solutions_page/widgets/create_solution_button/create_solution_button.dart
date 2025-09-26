import 'package:flutter/material.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/views/create_solution/create_solution.dart';
import 'package:my_social_app/views/solution/pages/display_question_abstract_solutions_page/widgets/create_solution_button/create_solution_button_constants.dart';

class CreateSolutionButton extends StatelessWidget {
  final int questionId;
  const CreateSolutionButton({
    super.key,
    required this.questionId,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 8),
          child: Text(
            youSolveIt[getLanguage(context)]!,
            style: const TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold
            ),
          )
        ),
        FilledButton(
          style: FilledButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(20),
            backgroundColor: Colors.green,
          ),
          onPressed: () => createSolution(context, questionId),
          child: const Icon(Icons.create),
        ),
      ],
    );
  }
}