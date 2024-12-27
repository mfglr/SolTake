import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/views/shared/count_text.dart';

class DownvoteButton extends StatelessWidget {
  final SolutionState solution;
  const DownvoteButton({
    super.key,
    required this.solution
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: (){
            final store = StoreProvider.of<AppState>(context,listen: false);
            solution.isDownvoted 
              ? store.dispatch(RemoveSolutionDownvoteAction(solutionId: solution.id))
              : store.dispatch(MakeSolutionDownvoteAction(solutionId: solution.id));
          },
          style: ButtonStyle(
            padding: WidgetStateProperty.all(EdgeInsets.zero),
            minimumSize: WidgetStateProperty.all(const Size(0, 0)),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          icon: Icon(
            solution.isDownvoted ? Icons.thumb_down : Icons.thumb_down_outlined,
            color: Colors.white,
            size: 35,
          )
        ),
        if(solution.numberOfDownvotes > 0)
          CountText(count: solution.numberOfDownvotes)
      ],
    );
  }
}