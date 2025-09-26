import 'package:flutter/material.dart';
import 'package:my_social_app/custom_packages/entity_state/entity_container.dart';
import 'package:my_social_app/state/solutions_state/solution_state.dart';
import 'package:my_social_app/views/solution/widgets/solution_container_abstract_widget/solution_container_abstract_widget.dart';

class SolutionContainerAbstractsWidget extends StatelessWidget {
  final Iterable<EntityContainer<int, SolutionState>> containers;
  final int numberOfColumn;
  final void Function(EntityContainer<int, SolutionState>) onTap;
  const SolutionContainerAbstractsWidget({
    super.key,
    required this.containers,
    required this.onTap,
    this.numberOfColumn = 2
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: containers
        .map((container) => GestureDetector(
          onTap: () => onTap(container),
          child: LayoutBuilder(
            builder: (context,constraints) => SizedBox(
              height: constraints.constrainWidth() / 2,
              width: constraints.constrainWidth() / 2,
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: SolutionContainerAbstractWidget(
                  container: container
                ),
              ),
            ),
          ),
        ))
        .toList()
    );
  }
}