import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_status.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class QuestionStateWidget extends StatelessWidget {
  final QuestionState question;
  const QuestionStateWidget({super.key,required this.question});

  @override
  Widget build(BuildContext context) {
    if(question.state == QuestionStatus.solved){
      return Text(
        AppLocalizations.of(context)!.question_state_solved,
        style: const TextStyle(
          color: Colors.green,
          fontWeight: FontWeight.bold
        ),
      );
    }
    return Text(
      AppLocalizations.of(context)!.question_state_unsolved,
      style: const TextStyle(
        color: Colors.yellow,
        fontWeight: FontWeight.bold
      ),
    );
  }
}