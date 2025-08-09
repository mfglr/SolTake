import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/solution_votes_state/actions.dart';
import 'package:my_social_app/state/app_state/solutions_state/solution_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/views/shared/count_text.dart';

class UpvoteButton extends StatelessWidget {
  final SolutionState solution;
  const UpvoteButton({
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
            solution.isUpvoted 
              ? store.dispatch(RemoveSolutionUpvoteAction(solution: solution))
              : store.dispatch(MakeSolutionUpvoteAction(solution: solution));
          },
          style: ButtonStyle(
            padding: WidgetStateProperty.all(EdgeInsets.zero),
            minimumSize: WidgetStateProperty.all(const Size(0, 0)),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          icon: Icon(
            solution.isUpvoted ? Icons.thumb_up : Icons.thumb_up_outlined,
            color: Colors.white,
            size: 35,
          )
        ),
        if(solution.numberOfUpvotes > 0)
          CountText(count: solution.numberOfUpvotes)
      ],
    );
  }
}