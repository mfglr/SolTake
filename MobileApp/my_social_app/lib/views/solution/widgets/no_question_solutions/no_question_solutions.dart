import 'package:flutter/material.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/views/solution/widgets/no_question_solutions/no_question_solutions_constants.dart';

class NoQuestionSolutions extends StatelessWidget {
  const NoQuestionSolutions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          noSolutionsYet[getLanguage(context)]!,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20
          ),
        ),
        Text(
          beFirst[getLanguage(context)]!,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 30
          ),
        )
      ],
    );
  }
}