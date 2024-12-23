import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CreateQuestionButton extends StatelessWidget {
  final void Function() onPressed;
  const CreateQuestionButton({
    super.key,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 4),
            child: Text(AppLocalizations.of(context)!.create_question_button_content),
          ),
          const Icon(Icons.create)
        ],
      ),
    );
  }
}