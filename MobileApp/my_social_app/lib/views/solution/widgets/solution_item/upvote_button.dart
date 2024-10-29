import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/state/app_state/store.dart';

class UpvoteButton extends StatelessWidget {
  final SolutionState solution;
  const UpvoteButton({super.key,required this.solution});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (){
        if(solution.isUpvoted){
          store.dispatch(RemoveSolutionUpvoteAction(solutionId: solution.id));
          return;
        }
        store.dispatch(MakeSolutionUpvoteAction(solutionId: solution.id));
      },
      color: Colors.green,
      style: ButtonStyle(
        padding: WidgetStateProperty.all(EdgeInsets.zero),
        minimumSize: WidgetStateProperty.all(const Size(0, 0)),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      icon: Builder(
        builder: (context) {
          if(solution.isUpvoted) return const Icon(Icons.thumb_up);
          return const Icon(Icons.thumb_up_outlined);
        }
      ),
    );
  }
}