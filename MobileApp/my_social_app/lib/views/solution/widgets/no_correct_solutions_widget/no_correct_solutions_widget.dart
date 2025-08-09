import 'package:flutter/material.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/views/solution/widgets/no_correct_solutions_widget/no_correct_solutions_widget_constants.dart';

class NoCorrectSolutionsWidget extends StatelessWidget {
  const NoCorrectSolutionsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          noCorrectSolutions[getLanguage(context)]!,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 30
          ),
        )
      ],
    );
  }
}