import 'package:flutter/material.dart';
import 'package:my_social_app/state/questions_state/question_state.dart';
import 'package:my_social_app/custom_packages/entity_state/entity_container.dart';
import 'package:my_social_app/views/question/widgets/question_container_abstract/question_container_abstract_widget.dart';

class QuestionContainerAbstractsWidget extends StatelessWidget {
  final int numberOfColumn;
  final Iterable<EntityContainer<int,QuestionState>> containers;
  final void Function(EntityContainer<int,QuestionState>) onTap;
  const QuestionContainerAbstractsWidget({
    super.key,
    required this.numberOfColumn,
    required this.containers,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Wrap(
        children: containers.map((container) => SizedBox(
          height: constraints.constrainWidth() / numberOfColumn,
          width: constraints.constrainWidth() / numberOfColumn,
          child: Container(
            margin: const EdgeInsets.all(1),
            child: GestureDetector(
              onTap: () => onTap(container),
              child: QuestionContainerAbstractWidget(
                container: container,
              ),
            ),
          ),
        ))
        .toList(),
      )
    );
  }
}