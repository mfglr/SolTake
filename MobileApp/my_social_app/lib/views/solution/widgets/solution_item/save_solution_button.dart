import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/solutions_state/solution_state.dart';
import 'package:my_social_app/state/app_state/solutions_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';

class SaveSolutionButton extends StatelessWidget {
  final SolutionState solution;
  const SaveSolutionButton({
    super.key,
    required this.solution
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (){
        final store = StoreProvider.of<AppState>(context,listen: false);
        solution.isSaved
          ? store.dispatch(UnsaveSolutionAction(solution: solution))
          : store.dispatch(SaveSolutionAction(solution: solution));
      },
      style: ButtonStyle(
        padding: WidgetStateProperty.all(const EdgeInsets.all(5)),
        minimumSize: WidgetStateProperty.all(const Size(0, 0)),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Icon(solution.isSaved ? Icons.bookmark : Icons.bookmark_outline) 
    );
  }
}