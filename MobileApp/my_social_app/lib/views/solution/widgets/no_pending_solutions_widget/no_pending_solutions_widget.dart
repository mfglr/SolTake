import 'package:flutter/material.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/views/solution/widgets/no_pending_solutions_widget/no_pending_solutions_widget_constants.dart';

class NoPendingSolutionsWidget extends StatelessWidget {
  const NoPendingSolutionsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          noPendingSolutions[getLanguage(context)]!,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 30
          ),
        )
      ],
    );
  }
}