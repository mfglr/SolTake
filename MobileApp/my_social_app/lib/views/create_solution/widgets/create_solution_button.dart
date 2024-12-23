import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
            child: Text(AppLocalizations.of(context)!.create_solution_button_content),
          ),
          const Icon(Icons.create)
        ],
      )
    );
  }
}