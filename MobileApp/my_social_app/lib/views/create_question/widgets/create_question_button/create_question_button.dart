import 'package:flutter/material.dart';
import 'package:my_social_app/views/shared/language_widget.dart';
import 'create_question_button_texts.dart';

class CreateQuestionButton extends StatelessWidget {
  final void Function() onPressed;
  const CreateQuestionButton({
    super.key,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
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
      ),
    );
  }
}