import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/views/shared/image_grid/image_grid.dart';

class SolutionAbstractItemWidget extends StatelessWidget {
  final SolutionState solution;
  final void Function(int solutionId) onTap;

  const SolutionAbstractItemWidget({
    super.key,
    required this.solution,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: GestureDetector(
        onTap: () => onTap(solution.id),
        child: ImageGrid(
          state: solution.medias.firstOrNull,
          onTap: () => onTap(solution.id),
        )
      ),
    );
  }
}