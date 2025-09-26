import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/l10n/app_localizations.dart';
import 'package:my_social_app/state/solutions_state/solution_state.dart';
import 'package:my_social_app/state/solutions_state/actions.dart';
import 'package:my_social_app/state/state.dart';

class MarkSolutionAsCorrectButton extends StatelessWidget {
  final SolutionState solution;
  const MarkSolutionAsCorrectButton({
    super.key,
    required this.solution,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (){
        final store = StoreProvider.of<AppState>(context,listen: false);
        store.dispatch(MarkSolutionAsCorrectAction(solution: solution));
      },
      style: ButtonStyle(
        padding: WidgetStateProperty.all(const EdgeInsets.all(0)),
        minimumSize: WidgetStateProperty.all(const Size(0, 0)),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Row(
        children: [
          const Icon(
            Icons.done,
            size: 18,
            color: Colors.green,
          ),
          Text(
            AppLocalizations.of(context)!.mark_solution_as_correct_button_content,
            style: const TextStyle(
              color: Colors.green,
              fontSize: 11
            ),
          )
        ],
      )
    );
  }
}