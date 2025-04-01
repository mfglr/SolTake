import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NoCommentsWidget extends StatelessWidget {
  const NoCommentsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppLocalizations.of(context)!.no_comments_title,
          style: const TextStyle(fontSize: 40),
          textAlign: TextAlign.center,
        ),
        Text(
          AppLocalizations.of(context)!.no_comments_description,
          style: const TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}