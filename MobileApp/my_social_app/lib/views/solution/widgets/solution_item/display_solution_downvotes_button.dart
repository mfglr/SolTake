import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/views/solution/pages/display_solution_downvotes_page/display_solution_downvotes_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DisplaySolutionDownvotesButton extends StatelessWidget {
  final SolutionState solution;
  const DisplaySolutionDownvotesButton({
    super.key,
    required this.solution
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed:() =>
        Navigator
          .of(context)
          .push(
            MaterialPageRoute(
              builder: (context) => DisplaySolutionDownvotesPage(
                solutionId: solution.id
              )
            )
          ),
      style: ButtonStyle(
        padding: WidgetStateProperty.all(const EdgeInsets.all(5)),
        minimumSize: WidgetStateProperty.all(const Size(0, 0)),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Text(
        "${solution.numberOfDownvotes.toString()} ${solution.numberOfDownvotes == 1 ? AppLocalizations.of(context)!.vote : AppLocalizations.of(context)!.votes}",
        style: const TextStyle(
          decoration: TextDecoration.underline
        ),
      )
    );
  }
}