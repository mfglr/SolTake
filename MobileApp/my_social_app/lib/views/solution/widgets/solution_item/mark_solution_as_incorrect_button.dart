import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/l10n/app_localizations.dart';
import 'package:my_social_app/state/app_state/questions_state/question_state.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/state/app_state/solutions_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';

class MarkSolutionAsIncorrectButton extends StatelessWidget {
  final QuestionState question;
  final SolutionState solution;
  const MarkSolutionAsIncorrectButton({
    super.key,
    required this.solution,
    required this.question
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (){
        final store = StoreProvider.of<AppState>(context,listen: false);
        store.dispatch(MarkSolutionAsIncorrectAction(question: question, solution: solution));
      },
      style: ButtonStyle(
        padding: WidgetStateProperty.all(const EdgeInsets.all(0)),
        minimumSize: WidgetStateProperty.all(const Size(0, 0)),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Row(
        children: [
          const Icon(
            Icons.close,
            size: 18,
            color: Colors.red,
          ),
          Text(
            AppLocalizations.of(context)!.mark_solution_as_incorrect_button_content,
            style: const TextStyle(
              color: Colors.red,
              fontSize: 11
            ),
          )
        ],
      )
    );
  }
}