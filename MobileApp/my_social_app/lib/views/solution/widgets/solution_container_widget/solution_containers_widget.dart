import 'package:flutter/material.dart';
import 'package:my_social_app/custom_packages/entity_state/entity_container.dart';
import 'package:my_social_app/state/solutions_state/solution_state.dart';
import 'package:my_social_app/views/solution/widgets/solution_container_widget/solution_container_widget.dart';

class SolutionContainersWidget extends StatelessWidget {
  final Iterable<EntityContainer<int, SolutionState>> containers;
  const SolutionContainersWidget({
    super.key,
    required this.containers
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: containers
        .map((container) => SolutionContainerWidget(
          container: container
        ))
        .toList()
    );
  }
}