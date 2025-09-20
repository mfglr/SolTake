import 'package:flutter/material.dart';
import 'package:my_social_app/custom_packages/entity_state/containers/loadable_container.dart';
import 'package:my_social_app/state/questions_state/question_state.dart';
import 'package:my_social_app/views/question/widgets/question_container_abstract_widget/loadable_question_abstract_widget.dart';

class LoadableQuestionAbstractsWidget extends StatelessWidget {
  final int numberOfColumn;
  final Iterable<LoadableContainer<int, QuestionState<int>>> containers;
  final void Function(LoadableContainer<int, QuestionState<int>>)? onTap;
  const LoadableQuestionAbstractsWidget({
    super.key,
    required this.containers,
    this.numberOfColumn = 2,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: 
        containers
          .map(
            (container) => GestureDetector(
              onTap: () => onTap != null ? onTap!(container) : null,
              child: LayoutBuilder(
                builder: (context, constraints) => SizedBox(
                  height: constraints.constrainWidth() / numberOfColumn,
                  width: constraints.constrainWidth() / numberOfColumn,
                  child: Padding(
                    padding: const EdgeInsetsGeometry.all(1),
                    child: LoadableQuestionAbstractWidget(
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