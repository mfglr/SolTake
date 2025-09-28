import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/custom_packages/entity_state/entity_container.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/state/solutions_state/actions.dart';
import 'package:my_social_app/state/solutions_state/solution_state.dart';
import 'package:my_social_app/state/solutions_state/solution_status.dart';
import 'package:my_social_app/state/state.dart';
import 'solution_status_widget_constants.dart';

class SolutionStatusWidget extends StatelessWidget {
  final EntityContainer<int,SolutionState> container;
  final double size;
  const SolutionStatusWidget({
    super.key,
    required this.container,
    this.size = 16
  });

  void _markAsCorrect(BuildContext context){
    if(container.isNotLoadSuccess){
      throw loadException[getLanguage(context)]!;
    }
    final solution = container.entity!;
    final store = StoreProvider.of<AppState>(context,listen: false);
    store.dispatch(MarkSolutionAsCorrectAction(solution: solution));
  }

  void _markAsIncorrect(BuildContext context){
    if(container.isNotLoadSuccess){
      throw loadException[getLanguage(context)]!;
    }
    final solution = container.entity!;
    final store = StoreProvider.of<AppState>(context,listen: false);
    store.dispatch(MarkSolutionAsIncorrectAction(solution: solution));
  }

  @override
  Widget build(BuildContext context) {
    final solution = container.entity!;
    if(solution.state == SolutionStatus.correct){
      return Icon(
        Icons.check_circle,
        color: Colors.green,
        size: size,
      );
    }
    else if(solution.state == SolutionStatus.pending){
      if(solution.doesBelongToQuestionOfCurrentUser){
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () => _markAsCorrect(context),
              icon: Icon(
                Icons.check,
                size: size,
                color: Colors.green,
              )
            ),
            IconButton(
              onPressed: () => _markAsIncorrect(context),
              icon: Icon(
                Icons.close,
                size: size,
                color: Colors.red,
              )
            )
          ],
        );
      }
      else{
        return Icon(
          Icons.pending,
          color: Colors.yellow,
          size: size,
        );
      }
    }
    else{
      return Icon(
        Icons.highlight_off,
        color: Colors.red,
        size: size,
      );
    }
  }
}