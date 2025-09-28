import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/custom_packages/entity_state/entity_container.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/state/solution_votes_state/actions.dart';
import 'package:my_social_app/state/solutions_state/solution_state.dart';
import 'package:my_social_app/state/state.dart';
import 'upvote_solution_button_constants.dart';

class UpvoteSolutionButton extends StatelessWidget {
  final EntityContainer<int, SolutionState> container;
  final Color color;
  final double size;
  const UpvoteSolutionButton({
    super.key,
    required this.container,
    this.color = Colors.white,
    this.size = 16
  });

  void _upvote(BuildContext context){
    if(container.isNotLoadSuccess){
      throw loadException[getLanguage(context)]!;
    }

    final solution = container.entity!;
    final store = StoreProvider.of<AppState>(context, listen: false);
    if(solution.isUpvoted){
      store.dispatch(RemoveSolutionUpvoteAction(solution: solution));
    }
    else{
      store.dispatch(MakeSolutionUpvoteAction(solution: solution));
    }
  }

  @override
  Widget build(BuildContext context) {
    final solution = container.entity!;
    return IconButton(
      onPressed: () => _upvote(context),
      icon: Icon(
        solution.isUpvoted
          ? Icons.thumb_up
          : Icons.thumb_up_outlined,
        color: color,
        size: size,
      )
    );
  }
}