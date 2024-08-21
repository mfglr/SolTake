import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/state/app_state/state.dart';

class MarkSolutionAsCorrectButton extends StatelessWidget {
  final SolutionState solution;
  const MarkSolutionAsCorrectButton({super.key,required this.solution});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (){
        final store = StoreProvider.of<AppState>(context,listen: false);
        store.dispatch(MarkSolutionAsCorrectAction(solutionId: solution.id,questionId: solution.questionId));
      },
      style: ButtonStyle(
        padding: WidgetStateProperty.all(const EdgeInsets.all(0)),
        minimumSize: WidgetStateProperty.all(const Size(0, 0)),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: const Row(
        children: [
          Icon(
            Icons.done,
            size: 18,
            color: Colors.green,
          ),
          Text(
            "Correct",
            style: TextStyle(
              color: Colors.green,
              fontSize: 11
            ),
          )
        ],
      )
    );
  }
}