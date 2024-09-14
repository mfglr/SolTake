import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NoQuestionAbstractItemsWidget extends StatelessWidget {
  const NoQuestionAbstractItemsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.not_interested,
          size: 45,
        ),
        Text(
          AppLocalizations.of(context)!.no_questions_abstract_items,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30
          ),
        )
      ],
    );
  }
}