import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/state/app_state/store.dart';

class UpvoteButtonWidget extends StatelessWidget {
  final SolutionState solution;
  const UpvoteButtonWidget({super.key,required this.solution});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (){
        if(solution.isUpvoted){
          store.dispatch(RemoveUpvoteAction(solutionId: solution.id));
          return;
        }
        store.dispatch(MakeUpvoteAction(solutionId: solution.id));
      },
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 5),
            child: Builder(
              builder: (context) {
                if(solution.isUpvoted) return const Icon(Icons.thumb_up);
                return const Icon(Icons.thumb_up_outlined);
              }
            ),
          ),
         Text(solution.numberOfUpvotes.toString())
        ],
      )
    );
  }
}