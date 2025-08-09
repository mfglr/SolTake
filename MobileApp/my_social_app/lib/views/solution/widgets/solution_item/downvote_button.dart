import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/solutions_state/solution_state.dart';
import 'package:my_social_app/state/app_state/store.dart';

class DownvoteButton extends StatelessWidget {
  final SolutionState solution;
  const DownvoteButton({super.key,required this.solution});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (){
        if(solution.isDownvoted){
          store.dispatch(RemoveSolutionDownvoteAction(solutionId: solution.id));
        }else{
          store.dispatch(MakeSolutionDownvoteAction(solutionId: solution.id));
        }
      },
      color: Colors.red,
      style: ButtonStyle(
        padding: WidgetStateProperty.all(EdgeInsets.zero),
        minimumSize: WidgetStateProperty.all(const Size(0, 0)),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      icon: Builder(
        builder: (context) {
          if(solution.isDownvoted) return const Icon(Icons.thumb_down);
          return const Icon(Icons.thumb_down_outlined);
        }
      ),
    );
  }
}