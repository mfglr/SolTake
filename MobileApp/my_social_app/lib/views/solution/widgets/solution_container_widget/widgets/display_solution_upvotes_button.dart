import 'package:flutter/material.dart';
import 'package:my_social_app/l10n/app_localizations.dart';
import 'package:my_social_app/state/solutions_state/solution_state.dart';
import 'package:my_social_app/views/solution/pages/display_solution_upvote_page/display_solution_upvotes_page.dart';

class DisplaySolutionUpvotesButton extends StatelessWidget {
  final SolutionState solution;
  const DisplaySolutionUpvotesButton({
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
              builder: (context) => DisplaySolutionUpvotesPage(
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
        "${solution.numberOfUpvotes.toString()} ${solution.numberOfUpvotes == 1 ? AppLocalizations.of(context)!.vote : AppLocalizations.of(context)!.votes}",
        style: const TextStyle(
          decoration: TextDecoration.underline
        ),
      ),
    );
  }
}