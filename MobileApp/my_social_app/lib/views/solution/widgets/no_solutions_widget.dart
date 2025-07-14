import 'package:flutter/material.dart';
import 'package:my_social_app/l10n/app_localizations.dart';

class NoSolutionsWidget extends StatelessWidget {
  const NoSolutionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppLocalizations.of(context)!.no_solutions_widget_conten3,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20
            ),
          ),
          Text(
             AppLocalizations.of(context)!.no_solutions_widget_conten4,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 30
            ),
          )
        ],
      ),
    );
  }
}