import 'package:flutter/material.dart';
import 'package:my_social_app/state/solution_votes_state/actions.dart';
import 'package:my_social_app/state/solutions_state/solution_state.dart';
import 'package:my_social_app/state/store.dart';

class DownvoteButton extends StatelessWidget {
  final SolutionState solution;
  const DownvoteButton({super.key,required this.solution});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (){
        if(solution.isDownvoted){
          store.dispatch(RemoveSolutionDownvoteAction(solution: solution));
        }else{
          store.dispatch(MakeSolutionDownvoteAction(solution: solution));
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