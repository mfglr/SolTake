import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/question_entity_state/uploading_solutions/uploading_solution_state.dart';
import 'package:my_social_app/views/solution/widgets/uploading_solution_abstract_item/uploading_solution_abstract_item.dart';

class UploadingSolutionAbstractItems extends StatelessWidget {
  final Iterable<UploadingSolutionState> solutions;
  const UploadingSolutionAbstractItems({
    super.key,
    required this.solutions
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: solutions.length,
      itemBuilder: (context,index) => Padding(
        padding: const EdgeInsets.all(1),
        child: UploadingSolutionAbstractItem(
          key: ValueKey(solutions.elementAt(index).id),
          solution: solutions.elementAt(index)
        ),
      )
    );
  }
}