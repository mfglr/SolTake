import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/create_comment_state/actions.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/views/comment/modals/display_solution_comments_modal.dart';
import 'package:my_social_app/views/shared/count_text.dart';

class SolutionCommentButton extends StatelessWidget {
  final SolutionState solution;
  const SolutionCommentButton({
    super.key,
    required this.solution
  });
  
  void _showCommentModal(BuildContext context){
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (context) => DisplaySolutionCommentsModal(solutionId: solution.id),
      isDismissible: true
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: (){
            _showCommentModal(context);
            final store = StoreProvider.of<AppState>(context,listen: false);
            store.dispatch(ChangeSolutionAction(solution: solution));
          },
          style: ButtonStyle(
            padding: WidgetStateProperty.all(EdgeInsets.zero),
            minimumSize: WidgetStateProperty.all(const Size(0, 0)),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          icon: const Icon(
            Icons.mode_comment_outlined,
            color: Colors.white,
            size: 35,
          )
        ),
        if(solution.numberOfComments > 0)
          CountText(count: solution.numberOfComments)
      ],
    );
  }
}