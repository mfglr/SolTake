import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/state/app_state/state.dart';

class MarkSolutionAsIncorrectButton extends StatelessWidget {
  final SolutionState solution;
  const MarkSolutionAsIncorrectButton({
    super.key,
    required this.solution
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (){
        final store = StoreProvider.of<AppState>(context,listen: false);
        store.dispatch(MarkSolutionAsIncorrectAction(questionId: solution.questionId, solutionId: solution.id));
      },
      style: ButtonStyle(
        padding: WidgetStateProperty.all(const EdgeInsets.all(0)),
        minimumSize: WidgetStateProperty.all(const Size(0, 0)),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: const Row(
        children: [
          Icon(
            Icons.close,
            size: 18,
            color: Colors.red,
          ),
          Text(
            "Correct",
            style: TextStyle(
              color: Colors.red,
              fontSize: 11
            ),
          )
        ],
      )
    );
  }
}