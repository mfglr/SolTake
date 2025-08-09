import 'package:flutter/material.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/views/solution/widgets/no_incorrect_solutions_widget/no_incorrect_solutions_widget_constants.dart';

class NoIncorrectSolutionsWidget extends StatelessWidget {
  const NoIncorrectSolutionsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          noIncorrectSolutions[getLanguage(context)]!,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 30
          ),
        )
      ],
    );
  }
}