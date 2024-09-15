import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NoSolutionsWidget extends StatelessWidget {
  final QuestionState question;
  const NoSolutionsWidget({super.key,required this.question});

  @override
  Widget build(BuildContext context) {
    if(question.isOwner){
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context)!.no_solutions_widget_conten1,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20
              ),
            ),
            Text(
              AppLocalizations.of(context)!.no_solutions_widget_conten2,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 30
              ),
            )
          ],
        ),
      );
    }
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