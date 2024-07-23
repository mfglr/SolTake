import 'package:flutter/material.dart';
import 'package:my_social_app/state/solution_entity_state/actions.dart';
import 'package:my_social_app/state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/state/solution_entity_state/solution_status.dart';
import 'package:my_social_app/state/store.dart';

class ApproveSolutionButtonWidget extends StatelessWidget {
  final SolutionState solution;
  const ApproveSolutionButtonWidget({super.key,required this.solution});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (){
        if(solution.state == SolutionStatus.pending){
          store.dispatch(MarkSolutionAsApprovedAction(solutionId: solution.id));
        }
        else{
          store.dispatch(MarkSolutionAsPendingAction(solutionId: solution.id));
        }
      },
      child: Builder(
        builder: (context) { 
          if(solution.state == SolutionStatus.pending) return const Icon(Icons.done);
          return const Icon(Icons.clear);
        }
      )
    );
  }
}