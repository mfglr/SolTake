import 'package:flutter/material.dart';
import 'package:my_social_app/custom_packages/entity_state/containers/base_container.dart';
import 'package:my_social_app/views/question/widgets/question_container_abstract_widget/question_container_abstract_widget.dart';

class QuestionContainerAbstractsWidget extends StatelessWidget {
  final int numberOfColumn;
  final Iterable<BaseContainer> containers;
  final Function(BaseContainer container) onTap;
  
  const QuestionContainerAbstractsWidget({
    super.key,
    required this.containers,
    required this.onTap,
    this.numberOfColumn = 2,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: 
        containers
          .map(
            (container) => GestureDetector(
              onTap: () => onTap(container),
              child: LayoutBuilder(
                builder: (context, constraints) => SizedBox(
                  height: constraints.constrainWidth() / numberOfColumn,
                  width: constraints.constrainWidth() / numberOfColumn,
                  child: Padding(
                    padding: const EdgeInsetsGeometry.all(1),
                    child: QuestionContainerAbstractWidget(
                      container: container,
                    ),
                  ),
                ),
              ),
            )
          )
          .toList()
    );
  }
}