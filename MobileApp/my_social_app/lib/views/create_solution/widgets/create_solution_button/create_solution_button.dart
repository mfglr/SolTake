import 'package:flutter/material.dart';
import 'package:my_social_app/views/shared/language_widget.dart';
import 'create_solution_button_texts.dart';

class CreateSolutionButton extends StatelessWidget {
  final void Function() onPressed;
  const CreateSolutionButton({
    super.key,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 4),
            child: LanguageWidget(
              child: (language) => Text(
                content[language]!
              ),
            ),
          ),
          const Icon(Icons.create)
        ],
      )
    );
  }
}