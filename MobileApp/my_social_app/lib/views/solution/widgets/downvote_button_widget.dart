import 'package:flutter/material.dart';
import 'package:my_social_app/state/solution_entity_state/actions.dart';
import 'package:my_social_app/state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/state/store.dart';

class DownvoteButtonWidget extends StatelessWidget {
  final SolutionState solution;
  const DownvoteButtonWidget({super.key,required this.solution});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (){
        if(solution.isDownvoted){
          store.dispatch(RemoveDownvoteAction(solutionId: solution.id));
          return;
        }
        store.dispatch(MakeDownvoteAction(solutionId: solution.id));
      },
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 5),
            child: Builder(
              builder: (context) {
                if(solution.isDownvoted) return const Icon(Icons.thumb_down);
                return const Icon(Icons.thumb_down_outlined);
              }
            ),
          ),
          Text(solution.numberOfDownvotes.toString())
        ],
      )
    );
  }
}